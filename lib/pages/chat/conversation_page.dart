import 'package:chat_bot/base.dart';
import 'package:chat_bot/components/paging/paging_widget.dart';
import 'package:chat_bot/pages/chat/providers/conversation_provider.dart';

class ConversationPage extends ConsumerWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var a = conversationProviderProvider;
    return Scaffold(
      appBar: JuAppBar.baseBar(text: "会话"),
      // body: PagingWidget(
      //   provider: conversationProviderProvider.notifier,
      //   futureRefreshable: futureRefreshable,
      //   notifierRefreshable: notifierRefreshable,
      //   contentBuilder: contentBuilder,
      // ),
    );
  }
}
