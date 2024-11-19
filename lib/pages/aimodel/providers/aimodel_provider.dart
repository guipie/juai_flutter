import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../base.dart';
import '../../../components/paging/paging_data.dart';
import '../../../components/paging/paging_notifier_mixin.dart';
import '../../../models/aimodel/ai_model.dart';
import '../../../services/http/address/modelai.dart';
import '../../../services/http/api.dart';
import '../prompt_page.dart';

part 'aimodel_provider.g.dart';

@Riverpod(keepAlive: true)
initPcPage(Ref ref) {
  return const PromptPage();
}

@riverpod
class AiModelNotifier extends _$AiModelNotifier with PagePagingNotifierMixin<AiModelSort> {
  @override
  Future<PagePagingData<AiModelSort>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<AiModelSort>> fetch({required int page}) async {
    var models = await Api.get<List<AiModel>, AiModel>(ApiModel.models, fromJsonT: AiModel.fromJson);
    var result = List<AiModelSort>.empty(growable: true);

    for (var element in models.result ?? []) {
      if (result.map((mm) => mm.key).contains(element.category)) {
        var item = result.firstWhere((mm) => mm.key == element.category);
        item.models.add(element);
      } else {
        result.add(AiModelSort(key: element.category, models: [element]));
      }
    }
    return PagePagingData(items: result, hasMore: models.result?.length == 10, page: page + 1);
  }
}
