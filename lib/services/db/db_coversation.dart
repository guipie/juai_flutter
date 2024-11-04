import 'package:chat_bot/models/chat/conversation_model.dart';
import 'package:chat_bot/services/db/db_base.dart';
import 'package:sqflite/sqlite_api.dart';

class DbConversation extends DbBase {
  @override
  String tableName = 'conversation';

  @override
  Future<void> onCreate(Database db, int version) async {
    super.createTable(ConversationModel.init().toJson());
  }
}
