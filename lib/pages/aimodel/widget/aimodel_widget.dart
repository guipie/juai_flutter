import '../../../base.dart';
import '../../../components/mouse_hover_item.dart';
import '../../../components/paging/paging_widget.dart';
import '../../../components/td/src/components/search/td_search_bar.dart';
import '../../../components/text_tips.dart';
import '../../../models/prompt/prompt_req_model.dart';
import '../view_model/aimodel_view_model.dart';
import '../view_model/prompt_view_model.dart';

class AimodelWidget {
  static Widget buildBody(BuildContext context, WidgetRef ref) {
    var promptReqProvider = ref.watch(promptReqNotifierProvider);
    var currentAiModelProvider = ref.watch(currentAiModelNotifierProvider);
    return PagingWidget(
      provider: aiModelVmProvider,
      futureRefreshable: aiModelVmProvider.future,
      notifierRefreshable: aiModelVmProvider.notifier,
      padding: const EdgeInsets.all(0),
      contentBuilder: (data, widgetCount, endItemView) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.paddingOf(context).bottom + kBottomNavigationBarHeight,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(maxHeight: 80),
                child: TDSearchBar(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                  placeHolder: '搜索试试',
                  autoHeight: false,
                  backgroundColor: Theme.of(context).colorScheme.onSecondary,
                  style: TDSearchStyle.square,
                  onTextChanged: (String text) {},
                ),
              ),
              TextTips(
                S.current.digitalMan,
                fontSize: 16,
              ),
              MouseHoverItem(
                isRadius: false,
                isSelected: promptReqProvider.category == PromptReqCategoryType.all,
                onTap: () => ref.read(promptVMProvider.notifier).promptMenuClick(PromptReqCategoryType.all),
                leadingWidget: Icon(
                  Icons.people,
                  size: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: S.current.digitalMan + S.current.home_square,
              ),
              MouseHoverItem(
                isRadius: false,
                isSelected: promptReqProvider.category == PromptReqCategoryType.my,
                onTap: () => ref.read(promptVMProvider.notifier).promptMenuClick(PromptReqCategoryType.my),
                leadingWidget: Icon(
                  Icons.person,
                  size: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: S.current.home_my + S.current.digitalMan,
              ),
              MouseHoverItem(
                isRadius: false,
                isSelected: promptReqProvider.category == PromptReqCategoryType.collection,
                onTap: () => ref.read(promptVMProvider.notifier).promptMenuClick(PromptReqCategoryType.collection),
                leadingWidget: Icon(
                  Icons.category,
                  size: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: S.current.home_my + S.current.collect,
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
                        isRadius: false,
                        isSelected: currentAiModelProvider?.modelId == item.modelId,
                        onTap: () => ref.read(currentAiModelNotifierProvider.notifier).update(item),
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
        );
      },
    );
  }

  static Widget buildAddDigitaMan(BuildContext context, WidgetRef ref, {Function()? onTap}) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Icon(
          Icons.add,
          color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
          size: 22,
        ),
      ),
    );
  }
}
