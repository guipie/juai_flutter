import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbSqlite {
  static final DbSqlite instance = DbSqlite.internal();
  factory DbSqlite() => instance;

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }
    // 初始化数据库
    _db = await initDb();
    return _db!;
  }

  DbSqlite.internal();

  // 创建数据库
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "juai_1.04.db");
    var theDb = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute("CREATE TABLE IF NOT EXISTS chat(id INTEGER PRIMARY KEY AUTOINCREMENT, conversationId int, chatOpenAiId TEXT,sendId int,recevieId int, sendTime TEXT,receiveTime,content TEXT)");
      db.execute("CREATE TABLE IF NOT EXISTS chat_last(conversationId int PRIMARY KEY, type TEXT,lastSender TEXT,lastSenderAvatar TEXT,lastSendTime TEXT,content TEXT,draf TEXT,userId int)");
    });
    return theDb;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      // 创建新表
      await db.execute("CREATE TABLE todos_v2(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");

      // 将旧表中的数据迁移到新表
      List<Map> oldTodos = await db.rawQuery("SELECT id, title, description FROM todos");
      for (Map todo in oldTodos) {
        await db.insert("todos_v2", {"id": todo["id"], "title": todo["title"], "description": todo["description"]});
      }

      // 删除旧表
      await db.execute("DROP TABLE tous");

      // 修改新表的名称
      await db.execute("ALTER TABLE todos_v2 RENAME TO todos");
    }
  }

  // 插入数据
  Future<int> insert(String table, Map<String, dynamic> row) async {
    Database db = await database;
    await _rowsCorrect(table, row);
    return await db.insert(table, row, nullColumnHack: "");
  }

  Future<int> insertExist(String table, Map<String, dynamic> row, String where, List<Object?> whereArgs) async {
    Database db = await database;
    var data = await db.query(table, where: where, whereArgs: whereArgs);
    await _rowsCorrect(table, row);
    if (data.isNotEmpty) {
      return await db.update(table, row, where: where, whereArgs: whereArgs);
    } else {
      return await db.insert(table, row, nullColumnHack: "");
    }
  }

  // 更新数据
  Future<int> update(String table, Map<String, dynamic> row, {String? where, List<Object?>? whereArgs}) async {
    Database db = await database;
    if (where == null || whereArgs == null) {
      where = 'id = ?';
      whereArgs = [row['id']];
    }
    return await db.update(table, row, where: where, whereArgs: whereArgs);
  }

  // 删除数据
  Future<int> deleteById(String table, int id) async {
    Database db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(String table, {String? where, List<Object?>? whereArgs}) async {
    Database db = await database;
    return await db.delete(table, where: where, whereArgs: whereArgs);
  }

  // 查询所有数据
  Future<List<Map<String, dynamic>>> queryAll(String table) async {
    Database db = await database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryWhere(String table, String where, List<Object?> whereArgs, {List<String>? columns}) async {
    Database db = await database;
    return await db.query(table, where: where, whereArgs: whereArgs, columns: columns);
  }

  Future<List<Map<String, dynamic>>> queryWhereOrderBy(String table, String where, List<Object?> whereArgs, int limit, String orderBy, {List<String>? columns}) async {
    Database db = await database;
    return await db.query(table, where: where, whereArgs: whereArgs, orderBy: orderBy, limit: limit, columns: columns);
  }

  Future<void> _rowsCorrect(String table, Map<String, dynamic> rows) async {
    Database db = await database;
    var data = await db.rawQuery("PRAGMA  table_info([$table])");
    var columns = data.map((e) => e["name"].toString().toLowerCase());
    rows.removeWhere((key, value) => !columns.contains(key.toLowerCase()));
  }
}
