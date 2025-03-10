import 'dart:async';

import '../base/base.dart';
import '../base/base_repository.dart';
import '../models/aimodel/aimodel_model.dart';
import '../services/db/db_aimodel.dart';

part 'aimodel_repository.g.dart';

@Riverpod(keepAlive: true)
AiModelRepository aiModelRepository(Ref ref) {
  return AiModelRepository();
}

class AiModelRepository extends BaseRepository<AiModel> {
  AiModelRepository() : super(listApi: ApisModelAi.models, detailApi: ApisModelAi.model, fromJsonT: AiModel.fromJson);

  Future<List<AiModelSort>> getListBySort() async {
    var models = await super.getList();
    if (models.isNotEmpty) unawaited(DbAiModel().addModels(models));
    var result = <AiModelSort>[];
    for (var element in models) {
      if (result.map((m) => m.key).toList().contains(element.service)) {
        var curItem = result.firstWhere((m) => m.key == element.service);
        curItem.models.add(element);
      } else {
        result.add(AiModelSort(key: element.service, models: [element]));
      }
    }
    return result;
  }

  //根据ID获取model
  Future<AiModel?> getModelById(String modelId) async {
    var model = await DbAiModel().getModelById(modelId);
    if (model != null) return model;
    return await getRouteDetail(modelId);
  }
}
