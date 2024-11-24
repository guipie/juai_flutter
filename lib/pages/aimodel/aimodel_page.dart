import '../../base.dart';
import '../../components/mouse_hover_item.dart';
import '../../components/td/src/components/checkbox/td_check_box_group.dart';
import '../../components/td/tdesign_flutter.dart';
import '../../components/text_search.dart';
import '../../components/text_tips.dart';
import '../../constants/assets.dart';
import 'model/aimodel_res_model.dart';
import 'prompt_page.dart';
import 'providers/aimodel_provider.dart';
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
