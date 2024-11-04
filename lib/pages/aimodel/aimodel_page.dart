import 'package:chat_bot/base.dart';
import 'package:chat_bot/components/td/tdesign_flutter.dart';
import 'package:chat_bot/pages/aimodel/providers/aimodel_provider.dart';

class AiModelPage extends ConsumerWidget {
  const AiModelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2 通过 ref.watch 获取数据
    final models = ref.watch(aiModelProviderProvider);
    models.v();
    final indexList = data.map((item) => item['index'] as String).toList();
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: TDIndexes(
          indexList: indexList,
          capsuleTheme: true,
          builderContent: (context, index) {
            final list = data.firstWhere((element) => element['index'] == index)['children'] as List<String>;
            return TDCellGroup(
              cells: list
                  .map((e) => TDCell(
                        title: e,
                        description: "hfhhf",
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
