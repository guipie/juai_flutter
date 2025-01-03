import '../../base.dart';
import '../../constants/enums/common_enum.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../models/chat/conversation_item_model.dart';
import 'db_base.dart';

class DbConversation extends DbBase {
  @override
  String tableName = 'conversation';

  @override
  Future<void> onCreate(Database db, int version) async {
    await super.createTable(ConversationItemModel(
      id: 0,
      title: '',
      type: ConversationEnum.chat,
      createTime: DateTime.now(),
      lastTime: DateTime.now(),
    ).toJson());
  }

  @override
  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    // super.onUpgrade(db, oldVersion, newVersion);
  }
  @override
  Future<void> onDowngrade(Database db, int oldVersion, int newVersion) async {
    // super.onDowngrade(db, oldVersion, newVersion);
  }
  Future<List<ConversationItemModel>> getConversations() async {
    var data = await super.find(orderBy: {'lastTime': SequenceEnum.desc});
    var list = data.map(ConversationItemModel.fromJson).toList();
    if (list.isEmpty) {
      var model = ConversationItemModel(
        id: 1,
        title: S.current.new_chat,
        desc: S.current.empty_content_need_add,
        type: ConversationEnum.chat,
        model: Constant.defaultModel,
        relationId: 0,
      );
      await addConversation(model);
      return [model];
    }
    return list;
  }

  Future<ConversationItemModel> getConversation(int id) async {
    var data = await super.find(where: {'id': id});
    return ConversationItemModel.fromJson(data.first);
  }

  Future<int> addConversation(ConversationItemModel conversation) async {
    var id = await super.insert(conversation.toJson());
    return id;
  }

  Future<int> updateConversation(ConversationItemModel conversation) async {
    var id = await super.update({'id': conversation.id}, conversation.toJson());
    return id;
  }

  Future<int> deleteConversation(int id) async {
    return await super.remove({'id': id});
  }
}
