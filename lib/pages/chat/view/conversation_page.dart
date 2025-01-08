import '../../../base/base.dart';
import '../../../base/base_page.dart';
import '../widgets/conversation_widget.dart';

class ConversationPage extends BasePage {
  const ConversationPage({super.key});
  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    // TODO: implement buildBody
    return ConversationWidget.buildConversations(ref, context);
  }

  @override
  // TODO: implement title
  String get title => '会话';
}
