import '../../../base.dart';
import '../widgets/conversation_widget.dart';

class ConversationPage extends ConsumerWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: JuAppBar.baseBar(text: '会话'),
      body: ConversationWidget.buildConversations(ref, context),
    );
  }
}
