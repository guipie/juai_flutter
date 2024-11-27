import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_down_button/pull_down_button.dart';

import '../../../base.dart';
import '../../../components/mouse_hover.dart';
import '../../../components/mouse_hover_item_Slidable.dart';
import '../../../components/riverpod_paging/paged_builder.dart';
import '../../../components/td/tdesign_flutter.dart';
import '../../../hive_bean/local_chat_history.dart';
import '../../../module/chat/chat_list_view_model.dart';
import '../../../utils/hive_box.dart';
import '../chat_page.dart';
import '../providers/conversation_provider.dart';

class ConversationWidget {
  static Widget buildConversationItem(
    ConversationModel item,
    WidgetRef ref,
    BuildContext context, {
    required Function(ConversationModel result) onClick,
  }) {
    return MouseHoverSlidableItem(
      leadingPicUrl: item.avatar!,
      title: item.name!,
      subTitle: item.desc ?? '',
      trailing: DateTime.now().millisecondsSinceEpoch.toYMDHM(),
      actions: [
        SlidableAction(
          onPressed: (context) {
            debugPrint('SlidableAction-1');
          },
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          icon: Icons.push_pin_outlined,
        ),
        SlidableAction(
          onPressed: (context) {
            debugPrint('SlidableAction-2');
          },
          backgroundColor: Colors.red,
          icon: Icons.delete,
        ),
      ],
    );
  }

  static PreferredSizeWidget bulidAppBar(WidgetRef ref, BuildContext context, {Function(String)? onSearchTextChanged}) {
    return JuAppBar.baseBar(
      text: S.current.home_chat,
      leadingWidth: 240,
      leading: F.pc
          ? SizedBox(
              width: 240,
              height: 60,
              child: TDSearchBar(
                placeHolder: '搜索搜索',
                autoHeight: false,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                style: TDSearchStyle.square,
                onTextChanged: (String text) {
                  onSearchTextChanged?.call(text);
                },
              ),
            )
          : null,
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
                        title: e.alias ?? '',
                        onTap: () {},
                      ))
                  .toList(),
            ];
          },
        ),
      ],
    );
  }

  static Widget buildConversations(WidgetRef ref) {
    return RiverPagedBuilder<int, ConversationModel>(
      firstPageKey: 1,
      pullToRefresh: true,
      provider: conversationProvider,
      itemBuilder: (context, item, index) {
        return buildConversationItem(
          item,
          ref,
          context,
          onClick: (current) {},
        );
      },
      pagedBuilder: (controller, builder) => PagedListView(pagingController: controller, builderDelegate: builder),
    );
  }
}
