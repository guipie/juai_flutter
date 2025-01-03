import '../base.dart';
import '../models/prompt/prompt_req_model.dart';
import '../models/prompt/prompt_res_model.dart';
import 'base_repository.dart';
part 'prompt_repository.g.dart';

@Riverpod(keepAlive: true)
PromptRepository promptRepository(Ref ref) {
  return PromptRepository();
}

class PromptRepository extends BaseRepository<PromptRes> {
  PromptRepository() : super(listApi: ApiModelAi.prompts, fromJsonT: PromptRes.fromJson);

  Future<List<PromptRes>> getListByCategory(PromptReq req) async {
    if (req.category == PromptReqCategoryType.all)
      return await getList(req: req.toJson());
    else if (req.category == PromptReqCategoryType.my)
      return await getList(req: req.toJson(), apiUrl: ApiModelAi.myPrompts);
    else
      throw Exception('not support');
  }
}
