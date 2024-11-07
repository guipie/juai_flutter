import '../../base.dart';
import '../../components/td/src/components/checkbox/td_check_box_group.dart';
import '../../components/td/tdesign_flutter.dart';
import '../../models/aimodel/aimodel_models.dart';
import 'providers/aimodel_provider.dart';

class AiModelPage extends ConsumerWidget {
  const AiModelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2 通过 ref.watch 获取数据
    final models = ref.watch(aiModelProviderProvider);
    // final indexList = models.valueOrNull?.map((m) => m.category).toList() ?? [];
    return Scaffold(
      body: switch (models) {
        AsyncData(:final value) => TDIndexes(
            indexList: value.map((m) => m.category).toSet().toList(),
            capsuleTheme: true,
            builderContent: (context, key) {
              return TDCellGroup(
                cells: value
                    .map((e) => TDCell(
                          title: e.name,
                          description: e.desc,
                        ))
                    .toList(),
              );
            },
          ),

        ///请求成功，返回数据value
        AsyncError() => const Text('Oops, something unexpected happened'),

        ///请求失败
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
