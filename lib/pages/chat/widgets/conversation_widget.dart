import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_down_button/pull_down_button.dart';

import '../../../base/base.dart';
import '../../../components/form/input_search.dart';
import '../../../components/image/avatar.dart';
import '../../../components/image/image.dart';
import '../../../components/paging/paging_widget.dart';
import '../../../models/chat/conversation_model.dart';
import '../../../utils/hive_box.dart';
import '../../aimodel/view_model/prompt_view_model.dart';
import '../view_model/chat_view_model.dart';
import '../view_model/conversation_state_view_model.dart';
import '../view_model/conversation_view_model.dart';

class ConversationWidget {
  static Widget buildConversationItem(
    ConversationModel item,
    WidgetRef ref,
    BuildContext context, {
    VoidCallback? onClick,
  }) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.4,
        children: [
          SlidableAction(
            onPressed: (context) {
              debugPrint('SlidableAction-1');
            },
            backgroundColor: fl.Colors.grey[30],
            icon: Icons.push_pin_outlined,
            padding: const EdgeInsets.symmetric(horizontal: 2),
          ),
          SlidableAction(
            onPressed: (context) {
              ref.read(conversationVmProvider.notifier).deleteConversation(item.id!);
            },
            foregroundColor: fl.Colors.grey[20],
            icon: Icons.delete,
            padding: const EdgeInsets.symmetric(horizontal: 2),
          ),
        ],
      ),
      child: fl.ListTile.selectable(
        shape: const Border(bottom: BorderSide(width: 0.05)),
        leading: JuImage(
          item.avatar,
          width: 42,
          height: 42,
        ),
        title: fl.Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            fl.Text(item.title),
            fl.Text(
              DateUtil.getTimePeriod(item.lastTime),
              style: TextStyle(
                color: ref.watch(themeProvider).timeColor(),
                fontSize: 10,
              ),
            )
          ],
        ),
        subtitle: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 8),
          child: fl.Text(
            item.desc ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ref.watch(themeProvider).timeColor(),
              fontSize: 12,
            ),
          ),
        ),
        selectionMode: fl.ListTileSelectionMode.single,
        selected: ref.watch(conversationStateVmProvider).current?.id == item.id,
        onPressed: () {
          F.pushChat(ref, conversation: item);
          onClick?.call();
        },
        cursor: SystemMouseCursors.click,
      ),
    );
  }

  static Widget appBarAction() {
    return PullDownButton(
      scrollController: ScrollController(),
      buttonBuilder: (context, showMenu) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            showMenu();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.add,
              color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
              size: 22,
            ),
          ),
        );
      },
      itemBuilder: (context) {
        return [
          PullDownMenuTitle(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              child: Text(
                S.current.text_parse_model,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          ...HiveBox()
              .openAIConfig
              .values
              .map((e) => PullDownMenuItem(
                    title: e.alias ?? '',
                    onTap: () {},
                  ))
              .toList(),
        ];
      },
    );
  }

  PreferredSizeWidget? bulidAppBar(WidgetRef ref, BuildContext context, {Function(String)? onSearchTextChanged}) {
    return JuAppBar.baseBar(
      text: S.current.home_chat,
      leadingWidth: 240,
      leading: F.pc
          ? const SizedBox(
              width: 240,
              height: 60,
              child: Text('SEARCH'),
            )
          : null,
      actions: [
        //添加按钮
        appBarAction(),
      ],
    );
  }

  static Widget buildConversations(WidgetRef ref, BuildContext context) {
    final itemsController = fl.FlyoutController();
    return PagingWidget(
      padding: const EdgeInsets.all(0),
      provider: conversationVmProvider,
      futureRefreshable: conversationVmProvider.future,
      notifierRefreshable: conversationVmProvider.notifier,
      contentBuilder: (data, widgetCount, endItemView) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: fl.TextBox(
                    onChanged: (text) => ref.read(conversationStateVmProvider.notifier).setSearch(text),
                    unfocusedColor: Colors.transparent,
                    focusNode: FocusNode(skipTraversal: true),
                    decoration: fl.WidgetStateProperty.all(
                      const fl.BoxDecoration(border: fl.Border()),
                    ),
                    prefix: const fl.Padding(padding: EdgeInsets.only(left: 10), child: fl.Icon(Icons.search, size: 18)),
                    placeholder: 'Search',
                  ),
                ),
                fl.FlyoutTarget(
                  controller: itemsController,
                  child: IconButton(
                    icon: const fl.Icon(
                      Icons.add,
                      size: 24,
                    ),
                    onPressed: () {
                      itemsController.showFlyout(
                          autoModeConfiguration: fl.FlyoutAutoConfiguration(
                            preferredMode: fl.FlyoutPlacementMode.bottomLeft,
                          ),
                          additionalOffset: 0,
                          // barrierDismissible: false,
                          // dismissOnPointerMoveAway: true,
                          navigatorKey: GlobalKey<NavigatorState>().currentState,
                          builder: (context) {
                            return fl.MenuFlyout(
                              items: [
                                fl.MenuFlyoutItem(
                                  text: Text(S.current.add + S.current.home_chat),
                                  onPressed: () => F.pushChat(ref),
                                ),
                                const fl.MenuFlyoutSeparator(),
                                fl.MenuFlyoutItem(
                                  text: Text(S.current.add + S.current.group_chat),
                                  onPressed: () => ref.read(chatVmProvider.notifier).addGroupChat(),
                                ),
                                const fl.MenuFlyoutSeparator(),
                                fl.MenuFlyoutItem(
                                  text: Text(S.current.custom + S.current.home_chat),
                                  onPressed: () => ref.read(promptVMProvider.notifier).promptAdd(context),
                                ),
                                const fl.MenuFlyoutSeparator(),
                              ],
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: fl.Button(
                onPressed: () => F.pushChat(ref),
                child: Text(
                  S.current.add + S.current.home_chat,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ).juCursor,
            ...data.items
                .map(
                  (e) => buildConversationItem(
                    e,
                    ref,
                    context,
                  ),
                )
                .toList(),
          ],
        );
      },
    );
  }
}
