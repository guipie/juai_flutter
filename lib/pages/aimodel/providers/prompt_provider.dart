import '../../../base.dart';
import '../../../components/paging/paging_data.dart';
import '../../../components/paging/paging_notifier_mixin.dart';
import '../../../components/riverpod_paging/paged_notifier_mixin.dart';
import '../../../models/aimodel/prompt.dart';
import '../../../services/http/address/modelai.dart';
import '../../../services/http/api.dart';

part 'prompt_provider.g.dart';

@riverpod
String category(Ref ref) => '';

@riverpod
class PromptNotifier extends _$PromptNotifier with PagePagingNotifierMixin<Prompt> {
  @override
  Future<PagePagingData<Prompt>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<Prompt>> fetch({required int page}) async {
    var lastCreatedAt = state.value?.items.last.createTime;
    var models = await Api.get<List<Prompt>, Prompt>(
      ApiModel.prompts,
      queryParameters: {'type': ref.read(categoryProvider), 'lastCreate': lastCreatedAt},
      fromJsonT: Prompt.fromJson,
    );
    return PagePagingData(items: models.result ?? [], hasMore: models.result?.length == 10, page: page + 1);
  }
}
