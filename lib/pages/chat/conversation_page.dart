import 'package:chat_bot/base.dart';
import 'package:chat_bot/components/riverpod_paging/paged_builder.dart';
import 'package:chat_bot/hive_bean/local_chat_history.dart';
import 'package:chat_bot/module/chat/chat_list_view_model.dart';
import 'package:chat_bot/pages/chat/providers/conversation_provider.dart';
import 'package:chat_bot/pages/chat/widgets/conversation_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'chat_page.dart';

class ConversationPage extends ConsumerWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: JuAppBar.baseBar(text: "会话"),
      body: RiverPagedBuilder<int, ConversationModel>(
        firstPageKey: 1,
        pullToRefresh: true,
        provider: conversationProvider,
        itemBuilder: (context, item, index) {
          return ConversationWidget.buildConversationItem(
            item,
            ref,
            context,
            onClick: (current) {
              var result = ChatParentItem();
              ref.watch(chatParentListProvider.notifier).update(result);

              F.push(ChatPage(localChatHistory: ChatParentItem())).then((value) {
                ref.read(chatParentListProvider.notifier).load();
              });
            },
          );
        },
        pagedBuilder: (controller, builder) => PagedListView(pagingController: controller, builderDelegate: builder),
      ),
    );
  }
}
