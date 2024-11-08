import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../base.dart';
import '../../components/riverpod_paging/paged_builder.dart';
import '../../hive_bean/local_chat_history.dart';
import '../../module/chat/chat_list_view_model.dart';
import 'chat_page.dart';
import 'providers/conversation_provider.dart';
import 'widgets/conversation_widget.dart';

class ConversationPage extends ConsumerWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: JuAppBar.baseBar(text: '会话'),
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
