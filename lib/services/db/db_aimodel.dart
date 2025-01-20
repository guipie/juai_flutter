import '../../base/base.dart';
import '../../constants/enums/common_enum.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../models/aimodel/aimodel_res_model.dart';
import '../../models/chat/conversation_item_model.dart';
import '../../models/prompt/prompt_res_model.dart';
import 'db_base.dart';

class DbConversationAiModel extends DbBase {
  @override
  String tableName = 'conversation_model';

  @override
  Future<void> onCreate(Database db, int version) async {
    await super.createTable(const AiModelRes(id: 0, modelId: '', name: '', avatarUrl: '', modelType: 0, service: '', serviceUrl: '').toJson());
  }

  Future<AiModelRes> getModel(String model) async {
    var data = await super.find(where: {'modelId': model});
    return AiModelRes.fromJson(data.first);
  }

  Future<void> addModels(List<AiModelRes> models) async {
    await super.removeAll();
    for (var item in models) {
      await super.insert(item.toJson());
    }
  }
}
