import '../../../base.dart';
import '../../../models/chat/conversation_item_model.dart';
import '../../../models/prompt/prompt_res_model.dart';
import '../../../services/db/db_aimodel.dart';
import '../../aimodel/view_model/aimodel_view_model.dart';
import '../../home/view_model/home_view_model.dart';
import '../state/conversation_state.dart';
import 'chat_view_model.dart';
import 'conversation_view_model.dart';
part 'conversation_state_view_model.g.dart';

@Riverpod(keepAlive: true)
class ConversationStateVm extends _$ConversationStateVm {
  @override
  ConversationState build() {
    return ConversationState();
  }

  Future<void> setCurrent(ConversationItemModel current, PromptRes? prompt) async {
    if (current.id == state.current?.id) return;
    var model = await DbConversationAiModel().getModel(current.model);
    state = ConversationState(current: current, aiModel: model, prompt: prompt);
    if (F.pc) ref.watch(homeVmProvider.notifier).setHomePcTitle(current.title);
    await ref.read(conversationVmProvider.notifier).addConversation(current, prompt);
    ref.invalidate(conversationVmProvider);
    ref.invalidate(chatVmProvider);
  }
}
