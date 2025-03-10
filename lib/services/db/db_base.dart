import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import '../../base/base.dart';
import '../../constants/enums/common_enum.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../models/aimodel/aimodel_model.dart';
import '../../utils/helper/my_path_provider.dart';
import '../../utils/helper/path.dart';
import 'db_aimodel.dart';
import 'db_chat.dart';
import 'db_coversation.dart';
import 'db_coversation_prompt.dart';
import 'db_dict.dart';
import 'prompt_item.dart';

export 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

class MyDbProvider {
  static void getInstance() {
    PromptItemProvider();
    DictProvider.getInstance();
    DbChat();
    DbConversation();
    DbAiModel();
    DbPrompt();
  }
}

abstract class DbBase {
  static const String _dbName = DbTables.dbName;
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
    _database ?? _initDatabase();
  }

  ///创建数据库
  Future<Database> _initDatabase() async {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    } else {
      if (F.desktop) {
        sqfliteFfiInit();
        databaseFactory = databaseFactoryFfi;
        var path = absolute(join(PathHelper().getHomePath, 'databases'));
        await databaseFactory.setDatabasesPath(path);
      }
    }
    unawaited(databaseFactory.getDatabasesPath().then((value) {
      debugPrint('sqlite地址：=== $value');
    }));
    // 数据库连接
    _database ??= await databaseFactory.openDatabase(
      _dbName,
      options: OpenDatabaseOptions(
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
      ),
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

  // Future<bool> addDiffColumns() async {

  //   return true;
  // }

  ///表是否存在
  Future<bool> tableExists() async {
    //内建表 sqlite_master
    var res = await _database!.rawQuery(
      "SELECT * FROM sqlite_master WHERE TYPE = 'table' AND NAME = '$tableName'",
    );
    return res.isNotEmpty;
  }

  ///表列是否存在
  Future<bool> columnExists(String columnName, {Map<String, dynamic>? repeatMap}) async {
    var result = await _database!.rawQuery("PRAGMA table_info('$tableName')");
    return result.isNotEmpty && result.any((m) => m['name'].toString().toUpperCase() == columnName.toUpperCase());
  }

  Future<Map<String, dynamic>> columnFilter(Map<String, Object?> maps) async {
    var result = await _database!.rawQuery("PRAGMA table_info('$tableName')");
    var cols = result.map((m) => m['name'].toString().toUpperCase()).toList();
    maps = Map.fromEntries(maps.entries.where((e) => cols.contains(e.key.toUpperCase())));
    return maps;
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
      switch (value.z) {
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
  _getIdVal(Map<String, Object?> values) {
    return values.entries.firstWhere((element) => element.key.toLowerCase() == 'id', orElse: () => const MapEntry('id', 0)).value.toInt();
  }

  ///插入数据
  insert(Map<String, Object?> values) async {
    var idVal = _getIdVal(values);
    if (idVal > 0 && await isExist({'id': _getIdVal(values)})) {
      return 0;
    }
    values = await columnFilter(values);
    var insertData = <String, Object?>{};
    for (var element in values.entries) {
      if (element.value != null) insertData[element.key] = element.value;
      if (element.value.runtimeType == bool) insertData[element.key] = element.value.toString().toUpperCase() == 'TRUE' ? 1 : 0;
    }
    return database.insert(tableName, insertData);
  }

  insertOrUpdate(Map<String, Object?> values) async {
    assert(values.keys.map((key) => key.toLowerCase()).contains('id'), 'no id');
    // var insertData = <String, Object?>{};
    // for (var element in values.entries) {
    //   if (element.value != null) insertData[element.key] = element.value;
    //   if (element.value.runtimeType == bool) insertData[element.key] = element.value.toString().toUpperCase() == 'TRUE' ? 1 : 0;
    // }
    var id = _getIdVal(values);
    values = await columnFilter(values);
    var model = await findById(id);
    if (model != null) {
      return database.update(tableName, values, where: 'id=$id');
    } else {
      return database.insert(tableName, values);
    }
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

  removeById(int id) async {
    var res = await database.delete(
      tableName,
      where: 'id=?',
      whereArgs: [id],
    );
    return res;
  }

  removeAll() async {
    return database.delete(tableName);
  }

  ///修改数据
  update(Map<String, Object?> whereData, Map<String, Object?> updateData) async {
    var keys = whereData.keys.toList();
    var where = <String>[];
    for (var i = 0; i < keys.length; i++) {
      var key = keys[i];
      if (whereData[key].runtimeType is String) {
        where.add("$key='${whereData[key]}'");
      } else if (whereData[key].runtimeType is DateTime) {
        where.add("date($key)='${DateUtil.formatDateObj(whereData[key]!, format: DateFormats.y_mo_d)}'");
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

  updateById(int id, Map<String, Object?> updateData) async {
    return database.update(
      tableName,
      updateData,
      where: 'id=$id',
    );
  }

  updateCompleteStatus(int id) async {
    return database.execute('UPDATE $tableName SET status="${ChatResStatusEnum.error.name}" WHERE id=$id and status="${ChatResStatusEnum.chatting.name}"');
  }

  ///缓存的数据
  static final Map<String, List<Map<String, Object?>>> _findCache = {};

  ///根据id查询单个x
  Future<Map<String, Object?>?> findById(int id) async {
    var one = await find(where: {'id': id});
    if (one.isNotNullOrEmpty) return one!.first;
    return null;
  }

  //根据查询条件判断是否存储记录
  Future<bool> isExist(Map<String, dynamic> where) async {
    var one = await find(where: where);
    return one.isNotNullOrEmpty;
  }

  ///查找数据
  Future<List<Map<String, Object?>>?> find({
    Map<String, dynamic>? where,
    Map<String, SequenceEnum>? orderBy,
    int? page,
    int? pageSize,
    bool isGetCache = true,
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

    var data = sql.isEmpty || !isGetCache ? [] : (_findCache[mapKey] ?? []);
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
