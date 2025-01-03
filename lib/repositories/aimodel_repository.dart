import 'dart:async';

import '../base.dart';
import '../constants/sp_kes.dart';
import '../models/aimodel/aimodel_res_model.dart';
import '../models/prompt/prompt_req_model.dart';
import '../models/prompt/prompt_res_model.dart';
import '../services/db/db_aimodel.dart';
import 'base_repository.dart';
part 'aimodel_repository.g.dart';

@Riverpod(keepAlive: true)
AiModelRepository aiModelRepository(Ref ref) {
  return AiModelRepository();
}

class AiModelRepository extends BaseRepository<AiModelRes> {
  AiModelRepository() : super(listApi: ApiModelAi.models, fromJsonT: AiModelRes.fromJson);

  Future<List<AiModelSort>> getListBySort() async {
    var models = await super.getList();
    if (models.isNotEmpty) unawaited(DbConversationAiModel().addModels(models));
    var result = <AiModelSort>[];
    for (var element in models) {
      if (result.map((m) => m.key).toList().contains(element.category)) {
        var curItem = result.firstWhere((m) => m.key == element.category);
        curItem.models.add(element);
      } else {
        result.add(AiModelSort(key: element.category, models: [element]));
      }
    }
    return result;
  }
}
