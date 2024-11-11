import '../../base.dart';
import '../../components/mouse_hover_item.dart';
import '../../components/td/src/components/checkbox/td_check_box_group.dart';
import '../../components/td/tdesign_flutter.dart';
import '../../components/text_search.dart';
import '../../components/text_tips.dart';
import '../../constants/assets.dart';
import 'prompt_page.dart';
import 'providers/aimodel_provider.dart';

class AiModelPcPage extends ConsumerWidget {
  const AiModelPcPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2 通过 ref.watch 获取数据
    final models = ref.watch(aiModelProviderProvider);
    final sortModels = ref.watch(sortAiModelsProvider);
    // final indexList = models.valueOrNull?.map((m) => m.category).toList() ?? [];
    return Scaffold(
        body: Row(
      children: [
        Container(
          width: 260,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            border: Border(right: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 1)),
          ),
          child: switch (models) {
            AsyncData() => SingleChildScrollView(
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
                      const TextTips(
                        '数字人',
                        fontSize: 16,
                      ),
                      MouseHoverItem(
                        leadingWidget: Icon(
                          Icons.people,
                          size: 36,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: '数字人广场',
                      ),
                      MouseHoverItem(
                        leadingWidget: Icon(
                          Icons.person,
                          size: 36,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: '我的数字人',
                      ),
                      MouseHoverItem(
                        leadingWidget: Icon(
                          Icons.category,
                          size: 36,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: '我的收藏',
                      ),
                      8.height(),
                      ...sortModels.entries.map(
                        (e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextTips(
                              e.key,
                              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                            ),
                            ...e.value.map(
                              (item) => MouseHoverItem(
                                leadingPicUrl: item.avatarUrl,
                                title: item.name,
                                subTitle: item.desc,
                                isShowDefaultTrailing: false,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ///请求成功，返回数据value
            AsyncError() => const Text('Oops, something unexpected happened'),

            ///请求失败
            _ => const CircularProgressIndicator(),
          },
        ),
        Expanded(
          child: PageView.builder(
            itemBuilder: (context, index) => const PromptPage(),
          ),
        ),
      ],
    ));
  }
}
