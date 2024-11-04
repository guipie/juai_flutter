import 'package:chat_bot/services/db/db_base.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DictProvider extends DbBase {
  DictProvider._();

  static DictProvider? _instance;

  static DictProvider getInstance() {
    _instance ??= DictProvider._();
    return _instance!;
  }

  @override
  String tableName = "ju_dict"; //字典表

  @override
  Future<void> onCreate(Database db, int version) async {
    await db.execute("""
      CREATE TABLE $tableName (
        id integer primary key autoincrement,
        key TEXT,
        value TEXT 
      )
    """);
  }
}
