import 'package:chat_bot/base.dart';
import 'package:chat_bot/components/td/tdesign_flutter.dart';
import 'package:chat_bot/pages/aimodel/aimodel_mv.dart';

class AiModelPage extends ConsumerWidget {
  const AiModelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexList = data.map((item) => item['index'] as String).toList();
    return TDButton(
      text: '胶囊索引',
      isBlock: true,
      size: TDButtonSize.large,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
            slideTransitionFrom: SlideTransitionFrom.right,
            builder: (context) {
              return Container(
                color: Colors.white,
                child: TDIndexes(
                  indexList: indexList,
                  capsuleTheme: true,
                  builderContent: (context, index) {
                    final list = data.firstWhere(
                            (element) => element['index'] == index)['children']
                        as List<String>;
                    return TDCellGroup(
                      cells: list
                          .map((e) => TDCell(
                                title: e,
                              ))
                          .toList(),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
