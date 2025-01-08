import '../../base/base.dart';
import '../../constants/enums/common_enum.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../models/chat/conversation_item_model.dart';
import '../../models/prompt/prompt_res_model.dart';
import 'db_base.dart';

class DbConversationPrompt extends DbBase {
  @override
  String tableName = 'conversation_prompt';

  @override
  Future<void> onCreate(Database db, int version) async {
    await super.createTable(PromptRes(
      id: 0,
      maxContext: 0,
      title: '',
      prompt: '',
      model: '',
      createTime: DateTime.now(),
    ).toJson());
  }

  Future<PromptRes> getConversationPrompt(int id) async {
    var data = await super.find(where: {'id': id});
    return PromptRes.fromJson(data.first);
  }

  Future<int> addConversationPrompt(PromptRes prompt) async {
    var id = await super.insertOrUpdate(prompt.toJson());
    return id;
  }

  //获取单个prompt
  Future<PromptRes?> getPrompt(int id) async {
    var data = await super.findById(id);
    if (data == null) return null;
    return PromptRes.fromJson(data);
  }

  Future<int> deleteConversation(int id) async {
    return await super.remove({'id': id});
  }
}
