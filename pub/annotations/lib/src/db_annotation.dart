library annotations;

class JuTable {
  const JuTable({required this.tableName});
  final String tableName;
}

class JuColumn {
  const JuColumn({
    this.name = "",
    this.type = DbType.text,
    this.primaryKey = false,
    this.nullable = true,
    this.unique = false,
    this.defaultValue,
  });

  final String name;
  final DbType type; // 支持的 SQLite 类型如 TEXT, INTEGER, REAL, BLOB
  final bool primaryKey; //主键
  final bool nullable; //可空
  final bool unique; // 唯一
  final dynamic defaultValue;
}

enum DbType { text, integer, real, blob, date, bool }
