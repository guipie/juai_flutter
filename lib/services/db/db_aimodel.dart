import '../../base/base.dart';
import '../../constants/enums/common_enum.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../models/aimodel/aimodel_model.dart';
import '../../models/chat/conversation_model.dart';
import '../../models/prompt/prompt_res_model.dart';
import 'db_base.dart';

class DbAiModel extends DbBase {
  @override
  String tableName = DbTables.dbModel;

  @override
  Future<void> onCreate(Database db, int version) async {
    await db.execute(AiModel.tableSql);
  }

  Future<AiModel?> getModelById(String model) async {
    var data = await super.find(where: {'modelId': model});
    if (data.isNotNullOrEmpty) return AiModel.fromJson(data!.first);
    return null;
  }

  Future<void> addModels(List<AiModel> models) async {
    await super.removeAll();
    for (var item in models) {
      await super.insert(item.toJson());
    }
  }
}
