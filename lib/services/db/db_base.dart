import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../base.dart';
import '../../constants/enums/common_enum.dart';
import 'chat_item.dart';
import 'db_coversation.dart';
import 'db_dict.dart';
import 'prompt_item.dart';

class MyDbProvider {
  static void getInstance() {
    PromptItemProvider();
    DictProvider.getInstance();
    ChatItemProvider();
    DbConversation();
  }
}

abstract class DbBase {
  static const String _dbName = 'juai202411302159.db';
  static const int _newVersion = 1;
  static int _oldVersion = 0;

  static Database? _database;

  ///表名称
  abstract String tableName;

  ///表是否存在
  bool exists = false;

  ///数据库实例化完成
  onReload(Database db, int version) {}

  ///创建表
  Future<void> onCreate(Database db, int version);

  ///更新表
  onUpgrade(Database db, int oldVersion, int newVersion) {}

  ///数据库降级
  onDowngrade(Database db, int oldVersion, int newVersion) {}

  DbBase() {
    _initDatabase();
  }

  ///创建数据库
  Future<Database> _initDatabase() async {
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    var dbBasePath = join(appDocumentsDir.path, 'databases', _dbName);
    if (Platform.isWindows || Platform.isLinux) {
      databaseFactoryOrNull = null;
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      dbBasePath = join(appDocumentsDir.path, 'databases', _dbName);
    } else {
      dbBasePath = join(await getDatabasesPath(), _dbName);
    }
    _database ??= await openDatabase(
      dbBasePath,
      version: _newVersion,
      onUpgrade: (db, old, newV) {
        _oldVersion = old;
      },
      onDowngrade: (db, old, newV) {
        _oldVersion = old;
      },
      onCreate: onCreate,
      readOnly: false,
      singleInstance: true,
    );

    onReload(_database!, _newVersion);

    //判断表是否存在
    exists = await tableExists();
    if (!exists) {
      await onCreate(_database!, _newVersion);
      exists = true;
    }

    if (_oldVersion != 0) {
      if (_oldVersion > _newVersion) {
        debugPrint('_oldVersion === $_oldVersion');
        debugPrint('_newVersion === $_newVersion');
        //数据库降级了
        await onDowngrade(
          _database!,
          await _database!.getVersion(),
          _newVersion,
        );
      } else if (_oldVersion < _newVersion) {
        debugPrint('_oldVersion === $_oldVersion');
        debugPrint('_newVersion === $_newVersion');
        //数据库升级了
        await onUpgrade(
          _database!,
          await _database!.getVersion(),
          _newVersion,
        );
      }
    }

    return _database!;
  }

  ///表是否存在
  Future<bool> tableExists() async {
    //内建表 sqlite_master
    var res = await _database!.rawQuery(
      "SELECT * FROM sqlite_master WHERE TYPE = 'table' AND NAME = '$tableName'",
    );
    return res.isNotEmpty;
  }

  ///表列是否存在
  Future<bool> columnExists(String columnName) async {
    var result = await _database!.rawQuery("""
      SELECT sql FROM sqlite_master WHERE type='table' AND name='$tableName' COLLATE NOCASE limit 1
    """);
    var sql = result[0]['sql'] as String;
    var startIndex = sql.indexOf('(') + 1;
    var endIndex = sql.indexOf(')');
    sql = sql.substring(startIndex, endIndex);

    var sqlList = sql.split(',').map((e) => e.trim()).toList();
    var exists = false;
    for (var j = 0; j < sqlList.length; j++) {
      var rowStr = sqlList[j].trim().split(',').join('');
      var colName = rowStr.split(' ')[0].trim();
      if (colName == columnName) {
        exists = true;
        break;
      }
    }
    return exists;
  }

  ///新增列
  Future addColumn(String columnName, String type) async {
    return await _database!.rawQuery('''
      ALTER TABLE $tableName ADD  $columnName $type
    ''');
  }

  ///新增表
  createTable(Map<String, dynamic> json, {bool hasPrimaryKey = true, String? keyName}) async {
    if (_database == null) {
      await _initDatabase();
    }
    final sqlBuffer = StringBuffer('CREATE TABLE $tableName (');
    json.forEach((key, value) {
      sqlBuffer.write('$key ');
      switch (value.runtimeType) {
        case int:
          sqlBuffer.write('INTEGER');
          if (hasPrimaryKey == true && key.toLowerCase() == (keyName ?? 'id')) {
            sqlBuffer.write(' PRIMARY KEY AUTOINCREMENT');
          }
          break;
        case double:
          sqlBuffer.write('REAL');
          break;
        case String:
          if (DateTime.tryParse(value) != null)
            sqlBuffer.write('DATETIME DEFAULT CURRENT_TIMESTAMP');
          else
            sqlBuffer.write('TEXT');
          break;
        case bool:
          sqlBuffer.write('BOOLEAN DEFAULT false');
          break;
        // case DateTime:
        //   sqlBuffer.write("DATETIME DEFAULT CURRENT_TIMESTAMP");
        //   break;
        default:
          sqlBuffer.write('TEXT');
        // throw Exception('Unsupported data type: ${value.runtimeType}');
      }
      sqlBuffer.write(', ');
    });
    sqlBuffer.write(')');
    await _database!.execute(sqlBuffer.toString().replaceAll(', )', ')'));
  }

  ///删表
  dropTable() async {
    if (_database == null) {
      await _initDatabase();
    }
    await _database!.execute('''
      drop table if exists $tableName;
    ''');
  }

  Database get database => _database!;

  ///插入数据
  insert(Map<String, Object?> values) async {
    var insertData = <String, Object?>{};
    for (var element in values.entries) {
      if (element.value != null) insertData[element.key] = element.value;
      if (element.value.runtimeType == bool) insertData[element.key] = element.value.toString().toUpperCase() == 'TRUE' ? 1 : 0;
    }
    return database.insert(tableName, insertData);
  }

  ///删除数据
  remove(Map<String, Object?> json) async {
    var keys = json.keys.toList();
    var where = <String>[];
    for (var i = 0; i < keys.length; i++) {
      var key = keys[i];
      where.add('$key=${json[key]}');
    }

    return database.delete(
      tableName,
      where: where.join(' and '),
    );
  }

  ///修改数据
  update(Map<String, Object?> whereData, Map<String, Object?> updateData) async {
    var keys = whereData.keys.toList();
    var where = <String>[];
    for (var i = 0; i < keys.length; i++) {
      var key = keys[i];
      if (whereData[key].runtimeType == String) {
        where.add("$key='${whereData[key]}'");
      } else {
        where.add('$key=${whereData[key]}');
      }
    }

    return database.update(
      tableName,
      updateData,
      where: where.isEmpty ? null : where.join(' and '),
    );
  }

  ///缓存的数据
  static final Map<String, List<Map<String, Object?>>> _findCache = {};

  ///查找数据
  Future<List<Map<String, Object?>>> find({
    Map<String, dynamic>? where,
    Map<String, SequenceEnum>? orderBy,
    int? page,
    int? pageSize,
  }) async {
    var keys = where?.keys.toList() ?? [];
    var whereList = <String>[];
    for (var i = 0; i < keys.length; i++) {
      var key = keys[i];
      if (where![key].runtimeType == String) {
        whereList.add("$key='${where[key]}'");
      } else {
        whereList.add('$key=${where[key]}');
      }
    }
    var sql = whereList.join(' and ');

    var ordeyBykeys = orderBy?.keys.toList() ?? [];
    var orderByList = <String>[];
    for (var i = 0; i < ordeyBykeys.length; i++) {
      var key = ordeyBykeys[i];
      orderByList.add('$key ${orderBy![key]!.name}');
    }
    var orderBysql = orderByList.join(' , ');
    var mapKey = '${tableName}_${sql}_page=${page}_pageSize=$pageSize';

    var data = sql.isEmpty ? [] : (_findCache[mapKey] ?? []);
    if (data.isNotEmpty) {
      return _findCache[mapKey]!;
    }
    var result = await database.query(
      tableName,
      where: sql.isEmpty ? null : sql,
      offset: page == null ? null : (page - 1) * (pageSize ?? 1),
      limit: pageSize,
      orderBy: orderBysql.isEmpty ? null : orderBysql,
    );
    if (sql.isNotEmpty) {
      _findCache[mapKey] = result;
    }
    return result;
  }

  rawQuery(String sql) async {
    return database.rawQuery(sql);
  }
}
