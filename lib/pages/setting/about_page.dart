import '../../base/base.dart';
import '../../base/base_page.dart';

class AboutPage extends BasePage {
  const AboutPage({super.key});

  @override
  // TODO: implement title
  String get title => S.current.add;

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(S.current.add),
    );
  }
}
