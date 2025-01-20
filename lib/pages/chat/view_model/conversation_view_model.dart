import '../../../base/base.dart';
import '../../../constants/enums/conversation_enum.dart';
import '../../../models/chat/conversation_item_model.dart';
import '../../../models/prompt/prompt_res_model.dart';
import '../../../services/db/db_coversation.dart';
import '../../../services/db/db_coversation_prompt.dart';
import 'conversation_state_view_model.dart';

part 'conversation_view_model.g.dart';

var searchTextPorvider = StateProvider<String>((ref) => '');

@riverpod
class ConversationVm extends _$ConversationVm with PagePagingNotifierMixin<ConversationItemModel> {
  @override
  Future<PagePagingData<ConversationItemModel>> build() => fetch(page: 1);

  late List<ConversationItemModel> initChats;
  @override
  Future<PagePagingData<ConversationItemModel>> fetch({required int page}) async {
    var chats = initChats = await DbConversation().getConversations();
    if (chats.isEmpty) {
      await addRandomChat();
      chats = initChats = state.value?.items ?? [];
    }
    return PagePagingData(items: chats, hasMore: false, page: page);
  }

  Future<void> addRandomChat() async {
    var model = ConversationItemModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: S.current.new_chat,
      desc: S.current.empty_content_need_add,
      type: ConversationEnum.chat,
      model: Constant.defaultModel,
      relationId: 0,
    );
    await addConversation(model, null);
  }

  void search(String text) {
    state.whenData((value) {
      var newValue = value.copyWith(items: initChats.where((element) => element.title.contains(text)).toList());
      state = AsyncValue.data(newValue);
    });
  }

  Future<void> deleteConversation(int id) async {
    await DbConversation().deleteConversation(id);
    state.whenData((value) {
      var newValue = value.copyWith(items: value.items.where((element) => element.id != id).toList());
      state = AsyncValue.data(newValue);
    });
  }

  Future<void> addConversation(ConversationItemModel conversation, PromptRes? prompt) async {
    if (state.value?.items.any((element) => element.id == conversation.id) == true) return;
    state = state.whenData((value) => value.copyWith(items: [conversation, ...value.items]));
    await DbConversation().addConversation(conversation);
    if (prompt != null) {
      await DbConversationPrompt().addConversationPrompt(prompt);
    }
    // state = AsyncValue.data(await fetch(page: 1));
  }
}
