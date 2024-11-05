import 'package:chat_bot/base.dart';
import 'package:chat_bot/components/riverpod_paging/paged_notifier.dart';
import 'package:chat_bot/components/riverpod_paging/paged_state.dart';

class ConversationNotifier extends PagedNotifier<int, ConversationModel> {
  ConversationNotifier()
      : super(
          load: _loadData,
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );
  int num = 1;

  static Future<List<ConversationModel>> _loadData(int page, int limit) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if (page > 3) return [];
    return List.generate(
        20,
        (index) => ConversationModel(
              id: index,
              name: "测试${index + ((limit * page) - limit)} ",
              desc: "My ${index + ((limit * page) - limit)} work",
              avatar: F.randomAvatar,
            ));
  }
  // @override
  // build() {
  //   var item = ConversationModel(name: '测试', avatar: F.randomAvatar);
  //   return [item, item, item, item, item, item];
  // }
}

final conversationProvider = StateNotifierProvider<ConversationNotifier, PagedState<int, ConversationModel>>((ref) => ConversationNotifier());