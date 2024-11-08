import '../../base.dart';
import '../../components/mouse_hover_item.dart';
import '../../components/td/src/components/checkbox/td_check_box_group.dart';
import '../../components/td/tdesign_flutter.dart';
import '../../components/text_search.dart';
import '../../components/text_tips.dart';
import '../../constants/assets.dart';
import '../../models/aimodel/aimodel_models.dart';
import 'providers/aimodel_provider.dart';

class AiModelPcPage extends ConsumerWidget {
  const AiModelPcPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2 通过 ref.watch 获取数据
    final models = ref.watch(aiModelProviderProvider);
    // final indexList = models.valueOrNull?.map((m) => m.category).toList() ?? [];
    return Scaffold(
      body: switch (models) {
        AsyncData(:final value) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.paddingOf(context).bottom + kBottomNavigationBarHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                    child: TDSearchBar(
                      placeHolder: '搜索试试',
                      autoHeight: false,
                      backgroundColor: Theme.of(context).colorScheme.onSecondary,
                      style: TDSearchStyle.square,
                      onTextChanged: (String text) {},
                    ),
                  ),
                  const TextTips('数字人'),
                  MouseHoverItem(
                    picUrl: Assets.svgAimodel,
                    title: '数字人广场',
                  ),
                  MouseHoverItem(
                    picUrl: Assets.svgAimodel,
                    title: '我的数字人',
                  ),
                  MouseHoverItem(
                    picUrl: Assets.svgAimodel,
                    title: '我的收藏',
                  ),
                  4.height(),
                  const TextTips('大模型'),
                  ...value
                      .map(
                        (e) => MouseHoverItem(
                          picUrl: F.randomAvatar,
                          title: e.name,
                          subTitle: e.desc ?? '',
                          isShowDefaultTrailing: false,
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ),

        ///请求成功，返回数据value
        AsyncError() => const Text('Oops, something unexpected happened'),

        ///请求失败
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
