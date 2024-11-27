import '../../base.dart';
import '../../components/button/filled_btn.dart';
import '../../components/form/label_text.dart';
import '../../components/mouse_hover_item.dart';
import 'model/aimodel_res_model.dart';

class AimodelDetailPage extends ConsumerWidget {
  const AimodelDetailPage(this.detail, {super.key});
  final AiModelRes detail;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 100),
      children: [
        MouseHoverItem(leadingPicUrl: detail.avatarUrl, title: detail.name, subTitle: detail.desc),
        const Divider(),
        LabelTextWidget(
          S.current.servers,
          detail.category,
          isShowDefaultTrailing: false,
        ),
        const Divider(),
        LabelTextWidget(
          'Token',
          detail.maxToken.toString(),
          weakenLabel: true,
          isShowDefaultTrailing: false,
        ),
        FilledBtnWidget(
          S.current.home_chat,
          size: const Size(50, 50),
          onPressed: () => F.pushChat(ref),
        )
      ],
    );
  }
}
