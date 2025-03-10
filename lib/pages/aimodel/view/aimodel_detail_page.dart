import 'package:fluent_ui/fluent_ui.dart' as fl;

import '../../../base/base.dart';
import '../../../base/base_page.dart';
import '../../../components/button/filled_btn.dart';
import '../../../components/form/label_text.dart';
import '../../../components/image/avatar.dart';
import '../../../constants/enums/conversation_enum.dart';
import '../../../constants/enums/widget_enum.dart';
import '../../../models/aimodel/aimodel_model.dart';

class AimodelDetailPage extends BasePage {
  const AimodelDetailPage(this.detail, {super.key});
  final AiModel detail;
  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
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
          '${S.current.maximum + S.current.input}:${detail.inputToken},${S.current.maximum + S.current.output}:${detail.outputToken}',
          weakenLabel: true,
          isShowDefaultTrailing: false,
        ),
        const fl.Divider(),
        LabelTextWidget(
          S.current.price,
          '￥${S.current.input}:${detail.inputYuan}/千token,￥${S.current.output}:${detail.inputYuan}/千token',
          weakenLabel: true,
          isShowDefaultTrailing: false,
        ),
        20.height(),
        FilledBtnWidget(
          S.current.home_chat,
          size: const Size(50, 50),
          onPressed: () => F.pushChat(ref, aiModelRes: detail),
        )
      ],
    ).juContainer();
  }

  @override
  // TODO: implement title
  String get title => '';
}
