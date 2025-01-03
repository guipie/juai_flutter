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
    ConversationItemModel? current,
    List<ConversationItemModel>? conversations,
    PromptRes? prompt,
  }) {
    return ConversationState(
      current: current ?? this.current,
      aiModel: aiModel ?? aiModel,
      prompt: prompt ?? this.prompt,
    );
  }
}
