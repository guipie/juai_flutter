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
    await super.createTable(AiModelRes(
      id: 0,
      modelId: '',
      name: '',
      shortName: '',
      avatarUrl: '',
      modelType: 0,
      category: '',
      maxToken: 0,
    ).toJson());
  }

  Future<AiModelRes> getModel(String name) async {
    var data = await super.find(where: {'name': name});
    return AiModelRes.fromJson(data.first);
  }

  Future<void> addModels(List<AiModelRes> models) async {
    await super.removeAll();
    for (var item in models) {
      await super.insert(item.toJson());
    }
  }
}
