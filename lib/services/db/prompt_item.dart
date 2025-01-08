import 'dart:convert';

import '../../base/base.dart';
import 'db_base.dart';
import 'package:sqflite_common/sqlite_api.dart';

import '../../constants/theme.dart';

const String columnTime = 'time';
const String columnAuthor = 'author';
const String columnTitle = 'title';
const String columnPrompt = 'prompt';
const String columnHint = 'hint';
const String columnExtra = 'extra';

class PromptItem {
  String? author;
  String? title;
  String? prompt;
  String? hint;
  int? time;
  String? extra;

  PromptItem({
    this.author,
    this.title,
    this.prompt,
    this.hint,
    this.time,
    this.extra,
  });

  Map<String, Object?> toJson() {
    return {
      'author': author,
      'title': title,
      'prompt': prompt,
      'hint': hint,
      'time': time,
      'extra': extra,
    };
  }

  factory PromptItem.fromJson(Map<String, Object?> map) {
    return PromptItem(
      author: map['author'] as String?,
      title: map['title'] as String?,
      prompt: map['prompt'] as String?,
      hint: map['hint'] as String?,
      time: map['time'] as int?,
      extra: map['extra'] as String?,
    );
  }

  PromptItem copyWith({
    String? author,
    String? title,
    String? prompt,
    String? hint,
    int? time,
    String? extra,
  }) {
    return PromptItem(
      author: author ?? this.author,
      title: title ?? this.title,
      prompt: prompt ?? this.prompt,
      hint: hint ?? this.hint,
      time: time ?? this.time,
      extra: extra ?? this.extra,
    );
  }
}

class PromptItemProvider extends DbBase {
  PromptItemProvider._();
  @override
  String tableName = 'prompt_item';

  static PromptItemProvider? _instance;

  factory PromptItemProvider() {
    _instance ??= PromptItemProvider._();
    return _instance!;
  }

  Future<PromptItem> insertItem(PromptItem item) async {
    item.time = await super.database.insert(tableName, item.toJson());
    return item;
  }

  //update
  Future<int> updateItem(PromptItem item) async {
    return await super.database.update(tableName, item.toJson(), where: '$columnTime = ?', whereArgs: [item.time]);
  }

  //list
  Future<List<PromptItem>> list() async {
    var maps = await super.database.query(tableName, columns: [columnTime, columnAuthor, columnTitle, columnPrompt, columnHint, columnExtra]);
    var list = List.generate(maps.length, (i) {
      return PromptItem.fromJson(maps[i]);
    });

    //解析assets里的json文件

    var languageCode = getLocaleByDefaultCode().languageCode;

    var file = 'command.json';
    if (languageCode == SupportedLanguage.zh.code) {
      file = 'command.json';
    } else if (languageCode == SupportedLanguage.en.code) {
      file = 'command_en.json';
    } else if (languageCode == SupportedLanguage.ja.code) {
      file = 'command_ja.json';
    } else if (languageCode == SupportedLanguage.ko.code) {
      file = 'command_ko.json';
    }

    var json = await rootBundle.loadString('assets/$file');
    var defaultPrompt = (jsonDecode(json) as List)
        .map((e) => PromptItem(
              title: e['title'],
              prompt: e['content'],
              time: 0,
            ))
        .toList();

    list.addAll(defaultPrompt);

    return list;
  }

  //delete
  Future<int> delete(int time) async {
    return await super.database.delete(tableName, where: '$columnTime = ?', whereArgs: [time]);
  }

  //delete all
  Future<int> deleteAll() async {
    return await super.database.delete(tableName);
  }

  Future close() async {
    super.database.close();
  }

  @override
  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
create table $tableName ( 
        $columnTime integer primary key, 
        $columnAuthor text,
        $columnTitle text,
        $columnPrompt text,
        $columnHint text,
        $columnExtra text)
''');
  }
}
