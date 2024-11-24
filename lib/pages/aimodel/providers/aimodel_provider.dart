import '../../../base.dart';
import '../../../components/paging/paging_data.dart';
import '../../../components/paging/paging_notifier_mixin.dart';
import '../../../components/td/src/components/calendar/td_calendar.dart';
import '../../../components/td/src/components/dropdown_menu/td_dropdown_item.dart';
import '../../../components/td/src/util/iterable_ext.dart';
import '../../../components/td/src/util/list_ext.dart';
import '../../../models/page_req.dart';
import '../model/aimodel_model.dart';
import '../model/aimodel_res_model.dart';
import '../prompt_page.dart';
import 'prompt_provider.dart';

part 'aimodel_provider.g.dart';

@riverpod
class AiModelDataNotifier extends _$AiModelDataNotifier with PagePagingNotifierMixin<AiModelSort> {
  @override
  Future<PagePagingData<AiModelSort>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<AiModelSort>> fetch({required int page}) async {
    var models = await Api.getList<AiModelRes>(AddressModelAi.models, fromJsonT: AiModelRes.fromJson);
    var result = <AiModelSort>[];
    for (var element in models.result ?? []) {
      if (result.map((m) => m.key).toList().contains(element.category)) {
        var curItem = result.firstWhere((m) => m.key == element.category);
        curItem.models.add(element);
      } else {
        result.add(AiModelSort(key: element.category, models: [element]));
      }
    }
    return PagePagingData(items: result, hasMore: false, page: page);
  }
}

@riverpod
class AiModelProvider extends _$AiModelProvider {
  @override
  AiModelModel build() {
    return AiModelModel();
  }

  void setSelectedPrompt(int val) {
    state = AiModelModel(selectedPrompt: val);
    if (val == 1) {
      ref.read(promptNotifierProvider.notifier).forceRefresh();
    }
  }

  void setSelectedAiModel(AiModelRes? val) {
    state = AiModelModel(selectedAiModel: val, selectedPrompt: 0);
  }
}
