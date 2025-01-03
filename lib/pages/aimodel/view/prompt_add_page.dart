import '../../../base.dart';
import '../../../components/button/filled_btn.dart';
import '../../../components/form/label_input.dart';
import '../../../components/form/label_input_multi.dart';
import '../../../components/form/label_text.dart';
import '../../../components/image.dart';
import '../../../components/mouse_hover_item.dart';

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
                        color: Colors.white, // 背景颜色
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
            LabelInputMultiWidget(
              S.current.prompt_hint,
              hintText: S.current.prompt_demo,
            ),
            LabelTextWidget(
              S.current.feedback,
              '全部可见',
              leading: Icon(
                Icons.public_outlined,
                color: Theme.of(context).colorScheme.primaryFixed,
              ),
            ),
            LabelTextWidget(
              S.current.home_model,
              Constant.defaultModel,
              leading: Icon(
                Icons.model_training_outlined,
                color: Theme.of(context).colorScheme.primaryFixed,
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
