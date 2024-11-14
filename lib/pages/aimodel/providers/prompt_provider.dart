import '../../../base.dart';
import '../../../components/paging/paging_data.dart';
import '../../../components/paging/paging_notifier_mixin.dart';
import '../../../components/riverpod_paging/paged_notifier_mixin.dart';
import '../../../models/aimodel/prompt.dart';
import '../../../services/db/prompt_item.dart';
import '../../../services/http/address/modelai.dart';
import '../../../services/http/api.dart';

part 'prompt_provider.g.dart';

@riverpod
String category(Ref ref) => '';

@riverpod
class PromptNotifier extends _$PromptNotifier with CursorPagingNotifierMixin<Prompt> {
  @override
  Future<CursorPagingData<Prompt>> build() => fetch(cursor: null);

  @override
  Future<CursorPagingData<Prompt>> fetch({
    required String? cursor,
  }) async {
    var lastCreatedAt = state.value?.items.last.createTime;
    if (cursor == null) {
      lastCreatedAt = null;
    }
    var models = await Api.get<List<Prompt>, Prompt>(
      ApiModel.prompts,
      queryParameters: {'category': ref.read(categoryProvider), 'lastCreate': lastCreatedAt},
      fromJsonT: Prompt.fromJson,
    );
    return CursorPagingData(items: models.result ?? [], hasMore: models.result?.length == 20, nextCursor: ((state.value?.items.length ?? 0) + 20).toString());
  }
}

final promptListProvider = StateNotifierProvider.autoDispose<PromptListNotify, AsyncValue<List<Prompt>>>((ref) {
  return PromptListNotify(const AsyncValue.loading());
});

class PromptListNotify extends StateNotifier<AsyncValue<List<Prompt>>> {
  PromptListNotify(AsyncValue<List<Prompt>> state) : super(state) {
    load();
  }

  void addPrompt(Prompt promptItem) {
    load();
  }

  void removePrompt(Prompt promptItem) {
    load();
  }

  void updatePrompt(Prompt promptItem) {
    load();
  }

  Future<void> load() async {
    state = await AsyncValue.guard(() => Future.value(List.generate(20, (index) => Prompt(id: index, type: 'fff', title: '测试数字人', avatar: F.randomPic, prompt: '马上过新年了，想好如何过年了吗？，今天我带大家在瀑布流布局中写新年快乐。在 Web 和移动开发世界中，当我们想要显示大小不相同的项目网格时，瀑布流布局很有用。一个轴使用严格的网格布局，通常是列。在另一个轴上，项目具有不同的高度，但可以灵活排列以填满可用空间。使用瀑布流布局的一个著名例子是 Pinterest。他们为他们的网站和移动应用程序实现了这种布局，以显示不同大小的图像。', createTime: DateTime.now()))));
  }
}
