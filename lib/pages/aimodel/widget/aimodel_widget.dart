import '../../../base.dart';
import '../../../components/mouse_hover_item.dart';
import '../../../components/paging/paging_widget.dart';
import '../../../components/td/src/components/search/td_search_bar.dart';
import '../../../components/text_tips.dart';
import '../../../models/aimodel/ai_model.dart';
import '../providers/aimodel_provider.dart';
import '../providers/prompt_provider.dart';

class AimodelWidget {
  static Widget buildBody(BuildContext context, WidgetRef ref) {
    return PagingWidget(
      provider: aiModelNotifierProvider,
      futureRefreshable: aiModelNotifierProvider.future,
      notifierRefreshable: aiModelNotifierProvider.notifier,
      contentBuilder: (data, widgetCount, endItemView) {
        return SingleChildScrollView(
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
                  isSelected: true,
                  leadingWidget: Icon(
                    Icons.people,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: '数字人广场',
                ),
                MouseHoverItem(
                  leadingWidget: Icon(
                    Icons.person,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: '我的数字人',
                ),
                MouseHoverItem(
                  leadingWidget: Icon(
                    Icons.category,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: '我的收藏',
                ),
                8.height(),
                ...data.items.map(
                  (e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextTips(
                        e.key,
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                      ),
                      ...e.models.map(
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
        );
      },
    );
  }
}
