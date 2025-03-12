import 'dart:math' as math;

import 'package:easy_refresh/easy_refresh.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;

import '../../../base/base.dart';
import '../../../base/base_page.dart';
import '../../../components/button/button_send.dart';
import '../../../components/form/icon_button.dart';
import '../../../components/image/avatar.dart';
import '../../../components/image/image.dart';
import '../../../constants/enums/conversation_enum.dart';
import '../../../models/chat/chat_model.dart';
import '../../../utils/mydialog.dart';
import '../../aimodel/widget/aimodel_widget.dart';
import '../../home/view_model/home_view_model.dart';
import '../../login/provider/login_provider.dart';
import '../../login/provider/user_provider.dart';
import '../state/conversation_state.dart';
import '../view_model/chat_state_view_model.dart';
import '../view_model/chat_view_model.dart';
import '../view_model/conversation_state_view_model.dart';
import '../view_model/conversation_view_model.dart';
import '../widgets/chat_widget.dart';

class ChatPage extends BasePage {
  ChatPage({super.key, this.cur});
  ConversationState? cur;
  @override
  String get title => cur?.current?.title ?? '';
  final _listenable = IndicatorStateListenable();

  bool _shrinkWrap = false;
  double? _viewportDimension;

  @override
  void initStateBase(WidgetRef ref) {
    inputController = TextEditingController();
    inputController.addListener(() {
      ref.read(chatStateVMProvider.notifier).setSendMsg(inputController.text);
    });
    _listenable.addListener(_onHeaderChange);
  }

  @override
  void disposeBase() {
    _listenable.removeListener(_onHeaderChange);
    inputController.dispose();
  }

  void _onHeaderChange() {
    final state = _listenable.value;
    if (state != null) {
      final position = state.notifier.position;
      _viewportDimension ??= position.viewportDimension;
      final shrinkWrap = state.notifier.position.maxScrollExtent == 0;
      if (_shrinkWrap != shrinkWrap && _viewportDimension == position.viewportDimension) {
        _shrinkWrap = shrinkWrap;
      }
    }
  }

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    // TODO: implement buildBody
    final themeData = ref.watch(themeProvider);
    var chats = ref.watch(chatVmProvider).value?.items ?? [];
    var chatState = ref.watch(chatStateVMProvider);
    var myAvatar = ref.watch(curentUserProvider).avatar;
    cur = ref.watch(conversationStateVmProvider);
    var receiveAvatar = (cur!.prompt?.avatar ?? cur!.aiModel?.avatarUrl) ?? Assets.imageAvatar;
    var sendBtn = chatState.sending
        ? ButtonSending(
            onPressed: () => ref.read(chatVmProvider.notifier).cancelSendMsg(),
          )
        : ButtonSend(
            onPressed: chatState.sendMsg.isEmptyJu() ? null : () => ref.read(chatVmProvider.notifier).sendMsg(inputController.text),
          );
    return Column(
      children: [
        Expanded(
          child: EasyRefresh(
            triggerAxis: Axis.vertical,
            clipBehavior: Clip.none,
            onRefresh: () {},
            onLoad: () {
              return Future.delayed(const Duration(seconds: 2), () {});
            },
            child: CustomScrollView(
              reverse: true,
              shrinkWrap: _shrinkWrap,
              scrollDirection: Axis.vertical,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var item = chats[((index % 2) > 0 ? index - 1 : index) ~/ 2];
                      // return chatItemText(context, item, myAvatar);
                      if ((index % 2) > 0)
                        return chatItemText(context, item, myAvatar);
                      else
                        return chatItemMdReceive(ref, context, item, receiveAvatar);
                    },
                    childCount: chats.length * 2,
                  ),
                ),
                // if (chats.isNotEmpty) chatItemMdReceive(ref, context, chats[0], receiveAvatar),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          decoration: BoxDecoration(
            // color: fl.FluentTheme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(2),
            border: Border(
              top: BorderSide(color: themeData.pinedBgColor(), width: 0.5),
            ),
          ),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                controller: inputController,
                minLines: F.pc ? 4 : 1,
                maxLines: 4,
                cursorColor: fl.FluentTheme.of(context).accentColor,
                decoration: const InputDecoration(
                  isDense: true, // 减少额外填充
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    gapPadding: 0,
                  ),
                  hintText: '请输入您的问题',
                  // hoverColor: fl.FluentTheme.of(context).activeColor,
                ),
                enabled: true,
                onSubmitted: (_) => ref.read(chatVmProvider.notifier).sendMsg(inputController.text),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 0.5.sw,
                    child: fl.CommandBar(
                      overflowBehavior: fl.CommandBarOverflowBehavior.wrap,
                      primaryItems: [
                        fl.CommandBarBuilderItem(
                          builder: (context, mode, w) => Tooltip(
                            message: S.current.ju_switch + S.current.models,
                            child: w,
                          ),
                          wrappedItem: fl.CommandBarButton(
                            icon: AimodelWidget.buildOptions(
                              context,
                              ref,
                              cur!.aiModel!,
                              (model) => ref.read(conversationStateVmProvider.notifier).setCurrentModel(model),
                            ),
                            onPressed: null,
                          ),
                        ),
                        fl.CommandBarBuilderItem(
                          builder: (context, mode, w) => Tooltip(
                            message: S.current.clear_context,
                            child: w,
                          ),
                          wrappedItem: fl.CommandBarButton(
                            icon: fl.Icon(
                              Icons.clear_all_outlined,
                              size: 24,
                              color: themeData.secondColor(),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        fl.CommandBarBuilderItem(
                          builder: (context, mode, w) => Tooltip(
                            message: ConversationState.maxContexts.firstWhere((m) => m.val == cur!.current!.maxContext.toString()).label,
                            child: w,
                          ),
                          wrappedItem: fl.CommandBarButton(
                            label: Container(
                              width: 26,
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: fl.FluentTheme.of(context).accentColor,
                              ),
                              child: Text(
                                '${ref.watch(conversationStateVmProvider).current!.maxContext}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Mydialog(
                                  context: context,
                                  itemStringList: ConversationState.maxContexts,
                                  selectIndex: ConversationState.maxContexts.indexWhere((m) => m.val == cur!.current!.maxContext.toString()),
                                  onSelected: (index, val) {
                                    ref.read(conversationVmProvider.notifier).setConversationContext(cur!.current!.id!, val.toInt());
                                  }).showSheetView();
                            },
                          ),
                        ),
                        // const fl.CommandBarSeparator(thickness: 0.5),
                      ],
                    ),
                  ),
                  sendBtn,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
