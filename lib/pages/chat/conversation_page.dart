import 'package:chat_bot/base.dart';
import 'package:chat_bot/components/paging/paging_widget.dart';

class ConversationPage extends ConsumerWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: JuAppBar.baseBar(text: "会话"),
      // body: PagingWidget(
      //   provider: conpro,
      //   futureRefreshable: futureRefreshable,
      //   notifierRefreshable: notifierRefreshable,
      //   contentBuilder: contentBuilder,
      // ),
    );
  }
}
