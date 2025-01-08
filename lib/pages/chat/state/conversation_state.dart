import '../../../models/aimodel/aimodel_res_model.dart';
import '../../../models/chat/conversation_item_model.dart';
import '../../../models/prompt/prompt_res_model.dart';

class ConversationState {
  ConversationState({
    this.current,
    this.aiModel,
    this.prompt,
  });

  final ConversationItemModel? current;
  final AiModelRes? aiModel;
  final PromptRes? prompt;

  ConversationState copyWith({
    ConversationItemModel? current_,
    AiModelRes? aiModel_,
    PromptRes? prompt_,
  }) {
    return ConversationState(
      current: current_ ?? current,
      aiModel: aiModel_ ?? aiModel,
      prompt: prompt_ ?? prompt,
    );
  }
}
