import '../../../base/base.dart';
import '../../../base/base_page.dart';
import '../../../components/common_loading.dart';
import '../view_model/conversation_state_view_model.dart';
import '../widgets/conversation_widget.dart';
import 'chat_page.dart';

class ConversationPcPage extends BasePage {
  const ConversationPcPage({super.key});

  @override
  String get title => '';
  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    // TODO: implement buildBody
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 250,
          height: double.infinity,
          decoration: BoxDecoration(
            color: ref.watch(themeProvider).secondBgColor(),
            border: Border(
              right: BorderSide(
                color: ref.watch(themeProvider).divideBgColor(),
              ),
            ),
          ),
          child: ConversationWidget.buildConversations(ref, context),
        ),
        Expanded(
          child: ref.watch(conversationStateVmProvider).current != null
              ? ChatPage()
              : EmptyData(
                  tips: S.current.chat_content_need_add,
                ),
        ),
      ],
    );
  }
}
