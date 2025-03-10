import '../../../base/base.dart';
import '../../../constants/sp_keys.dart';
import '../../../models/aimodel/aimodel_model.dart';
import '../../../repositories/aimodel_repository.dart';
import '../../home/view_model/home_view_model.dart';
import '../view/aimodel_detail_page.dart';
import 'prompt_view_model.dart';

part 'aimodel_view_model.g.dart';

@riverpod
class AiModelVm extends _$AiModelVm with PagePagingNotifierMixin<AiModelSort> {
  @override
  Future<PagePagingData<AiModelSort>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<AiModelSort>> fetch({required int page}) async {
    var models = await ref.read(aiModelRepositoryProvider).getListBySort();
    return PagePagingData(items: models, hasMore: false, page: page);
  }
}
