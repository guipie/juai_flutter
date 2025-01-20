import '../../../base/base.dart';
import '../../../base/base_page.dart';
import '../../../components/button/filled_btn.dart';
import '../../../components/form/form_row.dart';
import '../../../components/form/label_text.dart';
import '../../../components/image/avatar.dart';
import '../../../components/mouse_hover_item.dart';
import '../../../constants/enums/conversation_enum.dart';
import '../../../constants/enums/widget_enum.dart';
import '../../../models/aimodel/aimodel_res_model.dart';
import '../../home/view_model/home_view_model.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;

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
        // MouseHoverItem(leadingPicUrl: detail.avatarUrl, title: detail.name, subTitle: detail.desc),
        fl.ListTile(
          leading: JuAvatar(detail.avatarUrl, size: WSize.large),
          title: Text(detail.name),
          subtitle: Text(detail.desc ?? ''),
          cursor: SystemMouseCursors.click,
        ),
        const fl.Divider(),
        LabelTextWidget(
          S.current.servers,
          detail.service,
          isShowDefaultTrailing: false,
          weakenLabel: true,
        ),
        const fl.Divider(),
        LabelTextWidget(
          'Token',
          detail.inputToken.toString(),
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
