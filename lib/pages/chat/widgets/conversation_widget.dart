import 'package:chat_bot/base.dart';
import 'package:chat_bot/components/mouse_hover.dart';
import 'package:chat_bot/components/td/src/components/avatar/td_avatar.dart';
import 'package:chat_bot/hive_bean/local_chat_history.dart';
import 'package:chat_bot/module/chat/chat_list_view_model.dart';
import 'package:chat_bot/pages/chat/chat_page.dart';
import 'package:chat_bot/utils/hive_box.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ConversationWidget {
  static Widget buildConversationItem(
    ConversationModel item,
    WidgetRef ref,
    BuildContext context, {
    required Function(ConversationModel result) onClick,
  }) {
    return MouseHoverWidget(
      hoverColor: ref.watch(themeProvider).pinedBgColor(),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: 0.4,
          children: [
            SlidableAction(
              onPressed: (context) {
                debugPrint("SlidableAction-1");
              },
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              icon: Icons.push_pin_outlined,
            ),
            SlidableAction(
              onPressed: (context) {
                debugPrint("SlidableAction-2");
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          color: ref.watch(themeProvider).unPinedBgColor(),
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: ListTile(
            leading: TDAvatar(
              size: TDAvatarSize.medium,
              type: TDAvatarType.normal,
              shape: TDAvatarShape.square,
              avatarUrl: F.randomAvatar,
            ),
            title: Row(
              children: [
                Flexible(
                  child: Text(
                    item.name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  ),
                  child: Text(
                    "模型类比",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).primaryColor, fontSize: 8),
                  ),
                ),
              ],
            ),
            subtitle: Text(
              "contentcontentcontent",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14),
            ),
            trailing: Text(
              DateTime.now().millisecondsSinceEpoch.toYMDHM(),
              style: TextStyle(
                color: ref.watch(themeProvider).timeColor(),
                fontSize: 12,
              ),
            ),
          ),
        ),
      ).click(
        () => onClick(item),
      ),
    );
  }

  static PreferredSizeWidget bulidAppBar(WidgetRef ref) {
    return JuAppBar.baseBar(
      text: S.current.home_chat,
      actions: [
        //添加按钮
        PullDownButton(
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
                        title: e.alias ?? "",
                        onTap: () {
                          F
                              .push(ChatPage(
                                  showKeyboard: true,
                                  localChatHistory: ChatParentItem(
                                    apiKey: e.apiKey ?? "",
                                    id: DateTime.now().millisecondsSinceEpoch,
                                    moduleName: e.model,
                                    moduleType: e.defaultModelType?.id ?? "gpt-4",
                                    title: S.current.new_chat,
                                  )))
                              .then((value) {
                            ref.read(chatParentListProvider.notifier).load();
                          });
                        },
                      ))
                  .toList(),
            ];
          },
        ),
      ],
    );
  }
}
