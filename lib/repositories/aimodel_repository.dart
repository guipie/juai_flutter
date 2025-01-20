import 'dart:async';

import '../base/base.dart';
import '../base/base_repository.dart';
import '../models/aimodel/aimodel_res_model.dart';
import '../services/db/db_aimodel.dart';

part 'aimodel_repository.g.dart';

@Riverpod(keepAlive: true)
AiModelRepository aiModelRepository(Ref ref) {
  return AiModelRepository();
}

class AiModelRepository extends BaseRepository<AiModelRes> {
  AiModelRepository() : super(listApi: ApisModelAi.models, fromJsonT: AiModelRes.fromJson);

  Future<List<AiModelSort>> getListBySort() async {
    var models = await super.getList();
    if (models.isNotEmpty) unawaited(DbConversationAiModel().addModels(models));
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
}
