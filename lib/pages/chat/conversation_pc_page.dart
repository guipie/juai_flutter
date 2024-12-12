import '../../base.dart';
import '../../components/common_loading.dart';
import 'chat_page.dart';
import 'view_model/conversation_view_model.dart';
import 'widgets/conversation_widget.dart';

class ConversationPcPage extends ConsumerWidget {
  const ConversationPcPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: ConversationWidget.bulidAppBar(ref, context),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 250,
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 1)),
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            child: ConversationWidget.buildConversations(ref, context),
          ),
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => ref.watch(curConversationId) != null
                  ? const ChatPage()
                  : EmptyData(
                      tips: S.current.chat_content_need_add,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
