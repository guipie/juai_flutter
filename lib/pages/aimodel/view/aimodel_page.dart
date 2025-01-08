import '../../../base/base.dart';
import '../../../base/base_page.dart';
import '../widget/aimodel_widget.dart';

class AiModelPage extends BasePage {
  const AiModelPage({super.key});
  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    return AimodelWidget.buildBody(context, ref);
  }

  @override
  // TODO: implement title
  String get title => S.current.digitalMan + S.current.home_model;
}
