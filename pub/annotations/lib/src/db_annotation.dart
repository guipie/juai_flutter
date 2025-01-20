library annotations;

import 'package:source_gen/source_gen.dart';

const TypeChecker juTableChecker = TypeChecker.fromRuntime(JuTable);
const TypeChecker juColumnChecker = TypeChecker.fromRuntime(JuColumn);

class JuTable {
  const JuTable({required this.dbName});
  final String dbName;
}

class JuColumn {
  const JuColumn({
    this.name = "",
    this.type = ColumnType.text,
    this.primaryKey = false,
    this.nullable = true,
    this.unique = false,
    this.defaultValue,
  });

  final String name;
  final ColumnType type; // 支持的 SQLite 类型如 TEXT, INTEGER, REAL, BLOB
  final bool primaryKey; //主键
  final bool nullable; //可空
  final bool unique; // 唯一
  final dynamic defaultValue;
}

enum ColumnType { text, integer, real, blob, date, bool }
