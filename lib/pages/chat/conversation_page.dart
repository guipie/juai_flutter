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
      body: ConversationWidget.buildConversations(ref),
    );
  }
}
