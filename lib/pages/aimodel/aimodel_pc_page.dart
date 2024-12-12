import '../../base.dart';
import '../../components/mouse_hover_item.dart';
import '../../components/td/src/components/checkbox/td_check_box_group.dart';
import '../../components/td/tdesign_flutter.dart';
import '../../components/text_search.dart';
import '../../components/text_tips.dart';
import '../../constants/assets.dart';
import 'aimodel_detail_page.dart';
import 'prompt_page.dart';
import 'view_model/aimodel_view_model.dart';
import 'widget/aimodel_widget.dart';

class AiModelPcPage extends ConsumerWidget {
  const AiModelPcPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var aimodelProvider = ref.watch(currentAiModelNotifierProvider);
    return Scaffold(
        appBar: F.mobile
            ? JuAppBar.baseBar(
                text: S.current.digitalMan + S.current.home_model,
                actions: [
                  AimodelWidget.buildAddDigitaMan(context, ref),
                ],
              )
            : null,
        body: Row(
          children: [
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                border: Border(right: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 1)),
              ),
              child: AimodelWidget.buildBody(context, ref),
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => aimodelProvider != null
                    ? Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 50),
                        color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.7),
                        child: SizedBox(
                          width: 400,
                          child: AimodelDetailPage(aimodelProvider),
                        ),
                      )
                    : const PromptPage(),
              ),
            ),
          ],
        ));
  }
}
