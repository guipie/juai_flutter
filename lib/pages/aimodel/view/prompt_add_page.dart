import 'package:fluent_ui/fluent_ui.dart' as fl;

import '../../../base/base.dart';
import '../../../components/button/filled_btn.dart';
import '../../../components/form/form_row.dart';
import '../../../components/form/label_input.dart';
import '../../../components/form/label_input_multi.dart';
import '../../../components/form/label_text.dart';
import '../../../components/image/image.dart';
import '../../../components/mouse_hover_item.dart';
import '../view_model/aimodel_state_view_model.dart';
import '../widget/aimodel_widget.dart';

class PromptAddPage extends ConsumerWidget {
  const PromptAddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: JuAppBar.baseBar(text: S.current.btn_add + S.current.digitalMan),
      floatingActionButton: FilledBtnWidget(S.current.btn_add),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Stack(
                children: [
                  const JuImage(
                    Assets.imageAvatar,
                    width: 60,
                  ),
                  Positioned(
                    right: 0.0,
                    bottom: 0.0,
                    child: Container(
                      padding: const EdgeInsets.all(4.0), // 图标周围的内边距
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // 圆形背景
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1), // 阴影偏移
                          ),
                        ],
                      ),
                      child: const Icon(Icons.add, size: 20.0, color: Colors.blue), // 图标
                    ),
                  ),
                ],
              ),
            ),
            LabelInputWidget(
              S.current.name,
              hintText: S.current.btn_add + S.current.digitalMan,
            ),
            const fl.Divider(),
            LabelInputMultiWidget(
              S.current.prompt_hint,
              hintText: S.current.prompt_demo,
            ),
            const fl.Divider(
              size: 0.5,
            ),
            JuFormRow(
              S.current.feedback,
              right: const Text('全部可见'),
            ),
            JuFormRow(
              S.current.model,
              right: AimodelWidget.buildOptions(
                context,
                ref,
                ref.watch(aimodelStateViewModelProvider).defaultModel,
                (model) => ref.watch(aimodelStateViewModelProvider.notifier).changeDefaultModel(model),
                isEnableTxt: true,
              ),
            ),
            LabelInputMultiWidget(
              S.current.prompt_greeting,
              hintText: S.current.prompt_greeting_demo,
            ),
          ],
        ),
      ),
    );
  }
}
