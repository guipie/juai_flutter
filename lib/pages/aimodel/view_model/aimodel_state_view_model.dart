import 'dart:async';

import '../../../base/base.dart';
import '../../../models/aimodel/aimodel_model.dart';
import '../../../repositories/aimodel_repository.dart';
import '../../../services/db/db_aimodel.dart';
import '../state/aimodel_state.dart';
import '../view/aimodel_detail_page.dart';
import 'aimodel_view_model.dart';
import 'prompt_view_model.dart';

part 'aimodel_state_view_model.g.dart';

@riverpod
class AimodelStateViewModel extends _$AimodelStateViewModel {
  @override
  AimodelState build() {
    return AimodelState(SpUtil.getObj(SpKeys.defaultModel, AiModel.fromJson)!);
  }

  void setCurrentAiModel({AiModel? currentAiModel, bool isToChat = false}) {
    state = state.copyWith($currentAiModel: currentAiModel);
    ref.read(promptReqNotifierProvider.notifier).setCategory(null);
    if (F.mobile && isToChat) F.push(AimodelDetailPage(state.currentAiModel!));
  }

  void changeDefaultModel(AiModel model) async {
    Constant.defaultModel = model;
    state = state.copyWith($defaultModel: model);
    unawaited(SpUtil.putObject(SpKeys.defaultModel, model));
  }

  Future<AiModel> getAimodel(String modelId) async {
    var model = await aiModelRepository(ref).getModelById(modelId);
    if (model == null) {
      ('${modelId}model not support').fail();
      throw Exception('model is null');
    }
    return model;
  }
}
