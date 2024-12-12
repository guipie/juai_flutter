import '../../base.dart';
import 'widget/aimodel_widget.dart';

class AiModelPage extends ConsumerWidget {
  const AiModelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: JuAppBar.baseBar(text: 'AI模型'),
      body: AimodelWidget.buildBody(context, ref),
    );
  }
}
