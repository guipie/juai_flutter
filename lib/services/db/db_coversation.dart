import '../../base/base.dart';
import '../../constants/enums/common_enum.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../models/chat/conversation_model.dart';
import 'db_base.dart';

class DbConversation extends DbBase {
  @override
  String tableName = DbTables.dbConversation;

  @override
  Future<void> onCreate(Database db, int version) async {
    await db.execute(ConversationModel.tableSql);
  }

  @override
  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    // super.onUpgrade(db, oldVersion, newVersion);
  }
  @override
  Future<void> onDowngrade(Database db, int oldVersion, int newVersion) async {
    // super.onDowngrade(db, oldVersion, newVersion);
  }
  Future<List<ConversationModel>> getConversations() async {
    var data = await super.find(orderBy: {'lastTime': SequenceEnum.desc});
    var list = data?.map(ConversationModel.fromJson).toList() ?? [];
    return list;
  }

  Future<ConversationModel> getConversation(int id) async {
    var data = await super.find(where: {'id': id});
    if (data.isNotNullOrEmpty) return ConversationModel.fromJson(data!.first);
    throw Exception('Conversation not found');
  }

  Future<int> addConversation(ConversationModel conversation) async {
    var id = await super.insert(conversation.toJson());
    return id;
  }

  Future<int> updateConversation(ConversationModel conversation) async {
    var id = await super.update({'id': conversation.id}, conversation.toJson());
    return id;
  }

  Future<int> deleteConversation(int id) async {
    return await super.remove({'id': id});
  }
}
