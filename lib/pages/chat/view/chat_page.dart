import 'dart:math' as math;

import 'package:easy_refresh/easy_refresh.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;

import '../../../base.dart';
import '../../../base_page.dart';
import '../../../components/button/button_send.dart';
import '../../../components/image.dart';
import '../../../constants/enums/conversation_enum.dart';
import '../../../models/chat/chat_item_model.dart';
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
  ChatPage({super.key});
  late ConversationState? cur;
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
    var receiveAvatar = Assets.imageAvatar;
    if (cur!.current!.type == ConversationEnum.prompt)
      receiveAvatar = cur!.prompt!.avatar ?? Assets.imageAvatar;
    else if (cur!.current!.type == ConversationEnum.model) receiveAvatar = cur!.aiModel!.avatarUrl;
    var sendBtn = chatState.sending
        ? ButtonSending(
            onPressed: () => ref.read(chatVmProvider.notifier).cancelSendMsg(),
          )
        : ButtonSend(
            onPressed: chatState.sendMsg.isEmpty() ? null : () => ref.read(chatVmProvider.notifier).sendMsg(inputController.text),
          );
    return Column(
      children: [
        Expanded(
          child: EasyRefresh(
            scrollController: ScrollController(),
            triggerAxis: Axis.vertical,
            clipBehavior: Clip.none,
            onRefresh: () {},
            onLoad: () {
              return Future.delayed(const Duration(seconds: 2), () {});
            },
            child: CustomScrollView(
              reverse: true,
              shrinkWrap: _shrinkWrap,
              clipBehavior: Clip.none,
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
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
          decoration: BoxDecoration(
            color: themeData.secondBgColor(),
            border: Border(
              top: BorderSide(
                color: themeData.pinedBgColor(),
                width: 1,
              ),
            ),
          ),
          child: fl.Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 30),
                child: TextField(
                  autofocus: true,
                  controller: inputController,
                  minLines: F.pc ? 4 : 1,
                  maxLines: 8,
                  cursorColor: fl.FluentTheme.of(context).accentColor,
                  decoration: InputDecoration(
                    isDense: true, // 减少额外填充
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintText: '请输入您的问题',
                    suffixIcon: F.mobile ? sendBtn : null,
                    hoverColor: Colors.transparent,
                  ),
                  enabled: true,
                  onSubmitted: (_) => ref.read(chatVmProvider.notifier).sendMsg(inputController.text),
                ),
              ),
              if (F.pc)
                fl.Positioned(
                  bottom: 2,
                  right: 8,
                  child: sendBtn,
                ),
              Positioned(
                top: 0,
                right: 1,
                child: IconButton(
                  icon: Icon(
                    Icons.psychology_outlined,
                    size: 24,
                    color: themeData.secondColor(),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
