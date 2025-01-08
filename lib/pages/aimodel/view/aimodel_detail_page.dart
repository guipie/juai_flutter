import '../../../base/base.dart';
import '../../../base/base_page.dart';
import '../../../components/button/filled_btn.dart';
import '../../../components/form/label_text.dart';
import '../../../components/mouse_hover_item.dart';
import '../../../constants/enums/conversation_enum.dart';
import '../../../models/aimodel/aimodel_res_model.dart';
import '../../home/view_model/home_view_model.dart';

class AimodelDetailPage extends BasePage {
  const AimodelDetailPage(this.detail, {super.key});
  final AiModelRes detail;
  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    // TODO: implement buildBody
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      children: [
        MouseHoverItem(leadingPicUrl: detail.avatarUrl, title: detail.name, subTitle: detail.desc),
        const Divider(),
        LabelTextWidget(
          S.current.servers,
          detail.category,
          isShowDefaultTrailing: false,
          weakenLabel: true,
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
          onPressed: () => F.pushChat(ref, ConversationEnum.model, aiModelRes: detail),
        )
      ],
    );
  }

  @override
  // TODO: implement title
  String get title => '';
}
