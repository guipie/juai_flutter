import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../base.dart';
import '../../components/common_loading.dart';
import '../../components/riverpod_paging/paged_builder.dart';
import 'providers/conversation_provider.dart';
import 'widgets/conversation_widget.dart';

class ConversationPcPage extends ConsumerWidget {
  const ConversationPcPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentIndex = ref.watch(curConversationIndexProvider);
    var pageController = PageController(initialPage: currentIndex);
    return Scaffold(
      appBar: ConversationWidget.bulidAppBar(ref, context),
      body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 260,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            border: Border(right: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 1)),
          ),
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
