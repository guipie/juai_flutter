import '../../../base.dart';
import '../../../components/paging/paging_data.dart';
import '../../../components/paging/paging_notifier_mixin.dart';
import '../../../components/riverpod_paging/paged_notifier_mixin.dart';
import '../model/prompt_res_model.dart';

part 'prompt_provider.g.dart';

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  @override
  String build() => '';
  void update(String newValue) {
    state = newValue;
  }
}

@riverpod
class KeywordNotifier extends _$KeywordNotifier {
  @override
  String build() => '';
}

@riverpod
class PromptNotifier extends _$PromptNotifier with PagePagingNotifierMixin<PromptRes> {
  @override
  Future<PagePagingData<PromptRes>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<PromptRes>> fetch({
    required int page,
  }) async {
    var category = ref.read(categoryNotifierProvider);
    var query = PageReq(page: page, pageSize: 50, lastCreate: page == 1 ? null : state.value?.items.last.createTime);
    var models = await Api.getList<PromptRes>(
      category.isEmpty ? AddressModelAi.prompts : AddressModelAi.myPrompts,
      queryParameters: query.toJson().copyWith('searchKey', ref.read(keywordNotifierProvider)),
      fromJsonT: PromptRes.fromJson,
    );
    return PagePagingData(items: models.result ?? [], hasMore: models.result?.length == query.pageSize, page: query.page);
  }
}
