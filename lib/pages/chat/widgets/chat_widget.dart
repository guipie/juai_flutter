import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:markdown_widget/markdown_widget.dart';

import '../../../base/base.dart';
import '../../../components/image/avatar.dart';
import '../../../components/image/image.dart';
import '../../../components/markdown/code_wrapper_widget.dart';
import '../../../components/markdown/latex_widget.dart';
import '../../../constants/enums/conversation_enum.dart';
import '../../../models/chat/chat_model.dart';
import '../../aimodel/view_model/aimodel_view_model.dart';
import '../../login/login_page.dart';
import '../view_model/chat_view_model.dart';
import '../view_model/conversation_view_model.dart';

Widget chatItemText(BuildContext context, ChatModel item, String? avatar) {
  return LayoutBuilder(builder: (context, constraints) {
    final maxWidth = constraints.maxWidth - 120;
    return SelectionArea(
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              constraints: BoxConstraints(
                maxWidth: maxWidth,
              ),
              child: Text(
                item.sendMsg,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: JuAvatar(avatar),
            ),
          ],
        ),
      ),
    );
  });
}

Widget chatItemMdReceive(
  WidgetRef ref,
  BuildContext context,
  ChatModel item,
  String? receiveAvatar,
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
            child: JuAvatar(receiveAvatar),
          ),
          SelectionArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                fl.Text(
                  item.model,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: themeData.micaBackgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  constraints: fl.BoxConstraints(minWidth: 60, maxWidth: maxWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.stretch, // 拉伸子组件宽度
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...MarkdownGenerator(
                        generators: [latexGenerator],
                        inlineSyntaxList: [LatexSyntax()],
                        richTextBuilder: (span) => Text.rich(
                          span,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ).buildWidgets(
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
                      Row(
                        spacing: 6,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (item.status == ChatResStatusEnum.error)
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
                              width: 22,
                              height: 22,
                              child: const fl.ProgressRing(),
                            ),
                          if (item.status == ChatResStatusEnum.auth)
                            fl.IconButton(
                              iconButtonMode: fl.IconButtonMode.small,
                              onPressed: () {
                                F.pushAndRemoveUntil(LoginPage());
                              },
                              icon: fl.Text(
                                S.current.login,
                                style: const TextStyle(fontSize: 11, color: Colors.redAccent),
                              ),
                            ).juCursor,
                          if (ChatResStatusEnum.isOk(item.status) && item.resNum.isGreaterThanZero) ...[
                            RichText(
                              text: TextSpan(
                                text: S.current.input,
                                style: TextStyle(fontSize: 11, color: ref.read(themeProvider).secondColor()),
                                children: [
                                  TextSpan(
                                    text: '${item.reqNum.toThousandsFixed()}k',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: fl.Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: S.current.output,
                                style: TextStyle(fontSize: 11, color: ref.read(themeProvider).secondColor()),
                                children: [
                                  TextSpan(
                                    text: '${item.resNum.toThousandsFixed()}k',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: fl.Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          if (item.status != ChatResStatusEnum.chatting)
                            fl.DropDownButton(
                              buttonBuilder: (context, onOpen) {
                                return fl.IconButton(
                                  onPressed: onOpen,
                                  icon: const Icon(Icons.more_horiz_outlined),
                                  iconButtonMode: fl.IconButtonMode.small,
                                ).juCursor;
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
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  });
}
