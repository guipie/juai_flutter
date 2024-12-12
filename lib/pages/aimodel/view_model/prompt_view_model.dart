import '../../../base.dart';
import '../../../components/paging/paging_data.dart';
import '../../../components/paging/paging_notifier_mixin.dart';
import '../../../models/prompt/prompt_req_model.dart';
import '../../../models/prompt/prompt_res_model.dart';
import '../../../repositories/prompt_repository.dart';
import 'aimodel_view_model.dart';

part 'prompt_view_model.g.dart';

@Riverpod(keepAlive: true)
class PromptReqNotifier extends _$PromptReqNotifier {
  @override
  PromptReq build() => const PromptReq();

  void setCategory(PromptReqCategoryType category) {
    state = state.copyWith(category: category);
  }
}

final promptApi = Provider<PromptRepository>((ref) {
  return PromptRepository();
});

@riverpod
class PromptVM extends _$PromptVM with PagePagingNotifierMixin<PromptRes> {
  @override
  Future<PagePagingData<PromptRes>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<PromptRes>> fetch({
    required int page,
  }) async {
    var promptReq = ref.read(promptReqNotifierProvider);
    if (page == 1)
      promptReq = promptReq.copyWith(lastCreate: null);
    else
      promptReq = promptReq.copyWith(lastCreate: state.value?.items.last.createTime);
    var models = await ref.read(promptRepositoryProvider).getListByCategory(promptReq);
    return PagePagingData(items: models, hasMore: models.length == promptReq.pageSize, page: promptReq.page);
  }

  void promptMenuClick(PromptReqCategoryType val) {
    if (ref.read(promptReqNotifierProvider).category == val) return;
    ref.read(currentAiModelNotifierProvider.notifier).update(null);
    ref.read(promptReqNotifierProvider.notifier).setCategory(val);
    ref.read(promptVMProvider.notifier).forceRefresh();
  }
}
