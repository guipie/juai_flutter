import '../../constants/enums/common_enum.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../models/chat/chat_item_model.dart';
import 'db_base.dart';

class DbChat extends DbBase {
  @override
  String tableName = 'chat';

  @override
  Future<void> onCreate(Database db, int version) async {
    await super.createTable(ChatItemModel(
      id: 0,
      conversationId: 0,
      sendMsg: '',
      receiveMsg: '',
      sendId: 0,
      receiveId: 0,
      msgType: MsgTypeEnum.text,
      type: ConversationEnum.chat,
      createTime: DateTime.now(),
      lastTime: DateTime.now(),
      status: ChatResStatusEnum.error,
    ).toJson());
  }

  Future<List<ChatItemModel>> getChatList(int conversationId, int page) async {
    var data = await super.find(
      where: {'conversationId': conversationId},
      orderBy: {'createTime': SequenceEnum.desc},
      page: 1,
      pageSize: 20,
    );
    return data.map(ChatItemModel.fromJson).toList();
  }
}
