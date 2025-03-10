import '../../base/base.dart';
import '../../constants/enums/common_enum.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../models/chat/chat_model.dart';

class DbChat extends DbBase {
  @override
  String tableName = DbTables.dbChat;

  @override
  Future<void> onCreate(Database db, int version) async {
    await db.execute(ChatModel.tableSql);
  }

  Future<List<ChatModel>> getChatList(int conversationId, int page, {int pageSize = 20}) async {
    var data = await super.find(
      where: {'conversationId': conversationId},
      orderBy: {'createTime': SequenceEnum.desc},
      page: page,
      pageSize: pageSize,
      isGetCache: false,
    );
    return data?.map(ChatModel.fromJson).toList() ?? [];
  }

  Future<List<ChatModel>> getSuccessChatList(int conversationId, int page, {int pageSize = 20}) async {
    var data = await super.find(
      where: {'conversationId': conversationId, 'status': ChatResStatusEnum.success},
      orderBy: {'createTime': SequenceEnum.desc},
      page: page,
      pageSize: pageSize,
      isGetCache: false,
    );
    return data?.map(ChatModel.fromJson).toList().reversed.toList() ?? [];
  }
}
