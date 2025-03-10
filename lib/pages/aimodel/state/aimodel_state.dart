import '../../../models/aimodel/aimodel_model.dart';

class AimodelState {
  final AiModel? currentAiModel;
  final AiModel defaultModel;

  AimodelState(this.defaultModel, {this.currentAiModel});
  AimodelState copyWith({
    AiModel? $defaultModel,
    AiModel? $currentAiModel,
  }) {
    return AimodelState(
      $defaultModel ?? defaultModel,
      currentAiModel: $currentAiModel ?? currentAiModel,
    );
  }
}
