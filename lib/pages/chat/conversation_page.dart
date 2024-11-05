import 'package:chat_bot/base.dart';
import 'package:chat_bot/components/riverpod_paging/paged_builder.dart';
import 'package:chat_bot/pages/chat/providers/conversation_provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ConversationPage extends ConsumerWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: JuAppBar.baseBar(text: "会话"),
      body: RiverPagedBuilder<int, ConversationModel>(
        // the first page we will ask
        firstPageKey: 1,
        pullToRefresh: true,
        firstPageErrorIndicatorBuilder: (context, controller) => const Center(child: Text("11111111111")),
        // The [StateNotifierProvider] that holds the logic and the list of Posts
        provider: conversationProvider,
        // a function that build a single Post
        itemBuilder: (context, item, index) => ListTile(
          leading: CircleAvatar(child: Image.network(item.avatar!)),
          title: Text(item.name!),
        ),
        // The type of list we want to render
        // This can be any of the [infinite_scroll_pagination] widgets
        pagedBuilder: (controller, builder) => PagedListView(pagingController: controller, builderDelegate: builder),
      ),
    );
  }
}
