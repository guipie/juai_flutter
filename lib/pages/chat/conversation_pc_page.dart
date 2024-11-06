import 'package:chat_bot/base.dart';
import 'package:chat_bot/components/common_loading.dart';
import 'package:chat_bot/components/riverpod_paging/paged_builder.dart';
import 'package:chat_bot/pages/chat/providers/conversation_provider.dart';
import 'package:chat_bot/pages/chat/widgets/conversation_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ConversationPcPage extends ConsumerWidget {
  const ConversationPcPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentIndex = ref.watch(curConversationIndexProvider);
    var pageController = PageController(initialPage: currentIndex);
    return Scaffold(
      appBar: ConversationWidget.bulidAppBar(ref),
      body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: 260,
          child: RiverPagedBuilder<int, ConversationModel>(
            firstPageKey: 1,
            pullToRefresh: true,
            provider: conversationProvider,
            itemBuilder: (context, item, index) {
              return ConversationWidget.buildConversationItem(
                item,
                ref,
                context,
                onClick: (current) {},
              );
            },
            pagedBuilder: (controller, builder) => PagedListView(pagingController: controller, builderDelegate: builder),
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemBuilder: (context, index) => EmptyData(
              tips: S.current.chat_content_need_add,
            ),
          ),
        ),
      ]),
    );
  }
}
