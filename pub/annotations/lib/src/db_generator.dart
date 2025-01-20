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
      final columnName = columnAnnotation.computeConstantValue()!.getField('name')?.toStringValue();
      columnFields.add("'$columnName'");
    }
    // Generate the code that creates a table in SQLite.
    final createTableStmt = 'String get createTableSql => "CREATE TABLE IF NOT EXISTS $dbName (  ${columnFields.join(',')})";';
    // Return generated code as a string.
    return createTableStmt;
  }
}
