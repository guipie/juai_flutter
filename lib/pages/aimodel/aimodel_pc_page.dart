import '../../base.dart';
import '../../components/mouse_hover_item.dart';
import '../../components/td/src/components/checkbox/td_check_box_group.dart';
import '../../components/td/tdesign_flutter.dart';
import '../../components/text_search.dart';
import '../../components/text_tips.dart';
import '../../constants/assets.dart';
import '../../models/aimodel/ai_model.dart';
import 'prompt_page.dart';
import 'providers/aimodel_provider.dart';
import 'widget/aimodel_widget.dart';

class AiModelPcPage extends ConsumerWidget {
  const AiModelPcPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Row(
      children: [
        Container(
          width: 260,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            border: Border(right: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 1)),
          ),
          child: AimodelWidget.buildBody(context, ref),
        ),
        Expanded(
          child: PageView.builder(
            itemBuilder: (context, index) => const PromptPage(),
          ),
        ),
      ],
    ));
  }
}
