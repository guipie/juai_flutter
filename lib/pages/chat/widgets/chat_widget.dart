import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:markdown_widget/markdown_widget.dart';

import '../../../base.dart';
import '../../../components/image.dart';
import '../../../components/markdown/code_wrapper_widget.dart';
import '../../../constants/enums/conversation_enum.dart';
import '../../../models/chat/chat_item_model.dart';
import '../view_model/chat_view_model.dart';
import '../view_model/conversation_view_model.dart';

Widget chatItemText(BuildContext context, ChatItemModel item, String? avatar) {
  return LayoutBuilder(builder: (context, constraints) {
    final themeData = Theme.of(context);
    final maxWidth = constraints.maxWidth - 100;
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: themeData.colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            child: Text(
              item.sendMsg,
              style: TextStyle(fontSize: 6.sp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: JuImage(avatar, width: 36, height: 36),
          ),
        ],
      ),
    );
  });
}

Widget chatItemMdReceive(
  WidgetRef ref,
  BuildContext context,
  ChatItemModel item,
  String? avatar,
) {
  return LayoutBuilder(builder: (context, constraints) {
    final themeData = fl.FluentTheme.of(context);
    final maxWidth = constraints.maxWidth - 120;
    final config = ref.watch(themeProvider.notifier).isDarkMode ? MarkdownConfig.darkConfig : MarkdownConfig.defaultConfig;

    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: JuImage(avatar, width: 36, height: 36),
          ),
          SelectionArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: themeData.micaBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              constraints: fl.BoxConstraints(minWidth: 120, maxWidth: maxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Markdown(
                  //   selectable: true,
                  //   data: item.receiveMsg,
                  // ),
                  ...MarkdownGenerator().buildWidgets(
                    item.receiveMsg,
                    config: config.copy(
                      configs: [
                        LinkConfig(
                          style: const TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.underline,
                          ),
                          onTap: (url) {
                            ///TODO:on tap
                          },
                        ),
                        ref.watch(themeProvider.notifier).isDarkMode
                            ? PreConfig.darkConfig.copy(
                                wrapper: CodeWrapperWidget.new,
                              )
                            : const PreConfig().copy(
                                wrapper: CodeWrapperWidget.new,
                              ),
                      ],
                    ),
                  ),
                  // fl.Text(item.receiveMsg),
                  fl.Row(
                    mainAxisAlignment: fl.MainAxisAlignment.end,
                    children: [
                      if (ChatResStatusEnum.isError(item.status))
                        fl.Tooltip(
                          message: S.current.retry,
                          useMousePosition: false,
                          child: fl.IconButton(
                            icon: fl.Icon(
                              fl.FluentIcons.warning,
                              size: 6.sp,
                              color: fl.Colors.warningPrimaryColor,
                            ),
                            iconButtonMode: fl.IconButtonMode.small,
                            onPressed: () => ref.read(chatVmProvider.notifier).sendMsg(item.sendMsg, chatDbId: item.id),
                          ),
                        ),
                      if (item.status == ChatResStatusEnum.chatting)
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 26,
                          height: 26,
                          child: const fl.ProgressRing(),
                        ),
                      6.width(),
                      fl.DropDownButton(
                        title: const Icon(Icons.more_horiz_outlined),
                        buttonBuilder: (context, onOpen) {
                          return InkWell(
                            onTap: onOpen,
                            child: const Icon(Icons.more_horiz_outlined),
                          );
                        },
                        items: [
                          fl.MenuFlyoutItem(
                            text: Text(S.current.delete),
                            onPressed: () => ref.read(chatVmProvider.notifier).deleteChat(item.id!),
                          ),
                          const fl.MenuFlyoutSeparator(),
                          fl.MenuFlyoutItem(
                            text: Text(S.current.retry),
                            onPressed: () => ref.read(chatVmProvider.notifier).sendMsg(item.sendMsg, chatDbId: item.id),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  });
}
