import '../base.dart';
import '../models/aimodel/aimodel_res_model.dart';
import '../models/prompt/prompt_req_model.dart';
import '../models/prompt/prompt_res_model.dart';
import 'base_repository.dart';
part 'aimodel_repository.g.dart';

@Riverpod(keepAlive: true)
AiModelRepository aiModelRepository(Ref ref) {
  return AiModelRepository();
}

class AiModelRepository extends BaseRepository<AiModelRes> {
  AiModelRepository() : super(listApi: AddressModelAi.models, fromJsonT: AiModelRes.fromJson);

  Future<List<AiModelSort>> getListBySort() async {
    var models = await super.getList();
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
