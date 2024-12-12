import '../../../base.dart';
import '../../../components/paging/paging_data.dart';
import '../../../components/paging/paging_notifier_mixin.dart';
import '../../../models/chat/conversation_item_model.dart';
import '../../../services/db/db_coversation.dart';

part 'conversation_view_model.g.dart';

@riverpod
class ConversationVm extends _$ConversationVm with PagePagingNotifierMixin<ConversationItemModel> {
  @override
  Future<PagePagingData<ConversationItemModel>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<ConversationItemModel>> fetch({required int page}) async {
    var models = await DbConversation().getConversations();
    return PagePagingData(items: models, hasMore: false, page: page);
  }

  Future<void> deleteConversation(int id) async {
    await DbConversation().deleteConversation(id);
    state.whenData((value) {
      var newValue = value.copyWith(items: value.items.where((element) => element.id != id).toList());
      state = AsyncValue.data(newValue);
    });
  }

  Future<void> addConversation(ConversationItemModel conversation) async {
    await DbConversation().addConversation(conversation);
    state.whenData((value) {
      var newValue = value.copyWith(items: [conversation, ...value.items]);
      state = AsyncValue.data(newValue);
    });
  }
}

final curConversationId = StateProvider<int?>((ref) => null, name: 'conversationId');
