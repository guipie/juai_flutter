import '../../../base/base.dart';
import '../../../models/aimodel/aimodel_model.dart';
import '../../../models/chat/conversation_model.dart';
import '../../../models/common/dic.dart';
import '../../../models/prompt/prompt_res_model.dart';

class ConversationState {
  static List<Dic> maxContexts = [
    Dic(S.current.maxContext(0), '0'),
    Dic(S.current.maxContext(3), '3'),
    Dic(S.current.maxContext(5), '5'),
    Dic(S.current.maxContext(8), '8'),
    Dic(S.current.maxContext_extend, '-1'),
  ];
  ConversationState({
    this.current,
    this.aiModel,
    this.prompt,
    this.searchTxt,
  });

  final ConversationModel? current;
  final AiModel? aiModel;
  final PromptRes? prompt;
  final String? searchTxt;
  ConversationState copyWith({
    ConversationModel? current_,
    AiModel? aiModel_,
    PromptRes? prompt_,
    String? searchTxt_,
  }) {
    return ConversationState(
      current: current_ ?? current,
      aiModel: aiModel_ ?? aiModel,
      prompt: prompt_ ?? prompt,
      searchTxt: searchTxt_ ?? '',
    );
  }
}
