import '../../../base.dart';
import '../../../components/paging/paging_data.dart';
import '../../../components/paging/paging_notifier_mixin.dart';
import '../../../components/riverpod_paging/paged_notifier_mixin.dart';
import '../../../models/page_req.dart';
import '../model/prompt_res_model.dart';
import '../../../services/db/prompt_item.dart';

part 'prompt_provider.g.dart';

@riverpod
String category(Ref ref) => '';

@riverpod
class PromptNotifier extends _$PromptNotifier with PagePagingNotifierMixin<PromptRes> {
  @override
  Future<PagePagingData<PromptRes>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<PromptRes>> fetch({
    required int page,
  }) async {
    var query = PageReq(page: page, pageSize: 10, lastCreate: page == 1 ? null : state.value?.items.last.createTime);
    var models = await Api.getList<PromptRes>(
      AddressModelAi.prompts,
      queryParameters: query.toJson(),
      fromJsonT: PromptRes.fromJson,
    );
    return PagePagingData(items: models.result ?? [], hasMore: models.result?.length == query.pageSize, page: query.page);
  }
}

final promptListProvider = StateNotifierProvider.autoDispose<PromptListNotify, AsyncValue<List<PromptRes>>>((ref) {
  return PromptListNotify(const AsyncValue.loading());
});

class PromptListNotify extends StateNotifier<AsyncValue<List<PromptRes>>> {
  PromptListNotify(AsyncValue<List<PromptRes>> state) : super(state) {
    load();
  }

  void addPrompt(PromptRes promptItem) {
    load();
  }

  void removePrompt(PromptRes promptItem) {
    load();
  }

  void updatePrompt(PromptRes promptItem) {
    load();
  }

  Future<void> load() async {
    state = await AsyncValue.guard(() => Future.value(List.generate(20, (index) => PromptRes(id: index, type: 'fff', title: '测试数字人', avatar: F.randomPic, prompt: '马上过新年了，想好如何过年了吗？，今天我带大家在瀑布流布局中写新年快乐。在 Web 和移动开发世界中，当我们想要显示大小不相同的项目网格时，瀑布流布局很有用。一个轴使用严格的网格布局，通常是列。在另一个轴上，项目具有不同的高度，但可以灵活排列以填满可用空间。使用瀑布流布局的一个著名例子是 Pinterest。他们为他们的网站和移动应用程序实现了这种布局，以显示不同大小的图像。', createTime: DateTime.now()))));
  }
}
