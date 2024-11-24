import '../../base.dart';
import 'model/aimodel_res_model.dart';

class AimodelDetailPage extends ConsumerWidget {
  const AimodelDetailPage(this.detail, {super.key});
  final AiModelRes detail;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [Text(detail.name)],
    );
  }
}
