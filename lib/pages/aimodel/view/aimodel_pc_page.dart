import 'package:fluent_ui/fluent_ui.dart';

import '../../../base/base.dart';
import '../../../base/base_page.dart';
import '../view_model/aimodel_state_view_model.dart';
import '../view_model/aimodel_view_model.dart';
import '../widget/aimodel_widget.dart';
import 'aimodel_detail_page.dart';
import 'prompt_page.dart';

class AiModelPcPage extends BasePage {
  const AiModelPcPage({super.key});

  @override
  // TODO: implement title
  String get title => S.current.digitalMan + S.current.home_model;
  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    var curAimodel = ref.watch(aimodelStateViewModelProvider).currentAiModel;
    // TODO: implement buildBody
    return Row(
      children: [
        Container(
          width: 250,
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: ref.watch(themeProvider).divideBgColor(), width: 1)),
          ),
          child: AimodelWidget.buildBody(context, ref),
        ),
        Expanded(
          child: PageView.builder(
            itemBuilder: (context, index) => curAimodel != null ? AimodelDetailPage(curAimodel) : const PromptPage(),
          ),
        ),
      ],
    );
  }
}
