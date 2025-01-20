library annotations;

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'db_annotation.dart';

class DBGenerator extends GeneratorForAnnotation<JuTable> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'JuTable can only be used on classes.',
        element: element,
      );
    }
    final dbName = annotation.read('dbName').stringValue;
    // var cEelement = element as ClassElement;
    // print("开始解析--${element.name}\n");
    // for (var e in cEelement.unnamedConstructor!.children) {
    //   print("字段:${e.metadata.first.computeConstantValue()!.getField("name")!.toStringValue()}\n");
    // }
    // print("结束解析--${element.name}\n");

    final columnFields = <String>[];

    for (final field in (element).unnamedConstructor!.parameters) {
      print("字段${field.name}:${field.metadata}\n");
      if (!field.metadata.any((m) => m.element?.displayName == "JuColumn")) continue;
      final columnAnnotation = field.metadata.lastWhere((e) => e.element!.displayName == 'JuColumn');
      var existName = columnAnnotation.computeConstantValue()!.getField('name')?.toStringValue();
      var name = existName == null || existName.isEmpty ? field.name : existName;
      final type = columnAnnotation.computeConstantValue()!.getField("type")?.getField("index")?.toIntValue();
      final primaryKey = columnAnnotation.computeConstantValue()!.getField("primaryKey")?.toBoolValue();
      final nullable = columnAnnotation.computeConstantValue()!.getField("nullable")?.toBoolValue();
      final unique = columnAnnotation.computeConstantValue()!.getField("unique")?.toBoolValue();
      final defaultValue = columnAnnotation.computeConstantValue()!.getField("defaultValue")?.toStringValue();
      print("字段解析：name:$name, type:$type,key:$primaryKey,nullable:$nullable,unique:$unique");
      //text, integer, real, blob, date, bool
      if (type == ColumnType.integer.index)
        name = "$name INTEGER ${(nullable ?? true) ? "" : " NOT NULL"} ${(primaryKey ?? false) ? " PRIMARY KEY AUTOINCREMENT" : ""} ${(unique ?? false) ? " UNIQUE" : ""} ${defaultValue != null ? " DEFAULT $defaultValue" : ""}";
      else if (type == ColumnType.real.index)
        name = "$name REAL ${(nullable ?? true) ? "" : " NOT NULL"} ${(primaryKey ?? false) ? " PRIMARY KEY" : ""} ${(unique ?? false) ? " UNIQUE" : ""} ${defaultValue != null ? " DEFAULT $defaultValue" : ""}";
      else if (type == ColumnType.blob.index)
        name = "$name BLOB";
      else if (type == ColumnType.date.index)
        name = "$name TIMESTAMP  ${(nullable ?? true) ? "" : " NOT NULL"} ${(primaryKey ?? false) ? " PRIMARY KEY" : ""} ${(unique ?? false) ? " UNIQUE" : ""}  DEFAULT ${defaultValue ?? "CURRENT_TIMESTAMP"} ";
      else if (type == ColumnType.bool.index)
        name = "$name INTEGER  ${(nullable ?? true) ? "" : " NOT NULL"} CHECK($name=0 OR $name=1)";
      else
        name = "$name TEXT  ${(nullable ?? true) ? "" : " NOT NULL"} ${(primaryKey ?? false) ? " PRIMARY KEY" : ""} ${(unique ?? false) ? " UNIQUE" : ""}  ${defaultValue != null ? " DEFAULT $defaultValue" : ""}";
      columnFields.add(name);
    }
    // Generate the code that creates a table in SQLite.
    final createTableStmt = "String get createTableSql => 'CREATE TABLE IF NOT EXISTS $dbName (  ${columnFields.join(',')})';";
    // Return generated code as a string.
    return createTableStmt;
  }
}
