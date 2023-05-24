import 'package:guxin_ai/entities/content/content.dart';

class SpecialResEntity {
  String title;
  String summary;
  dynamic content;
  String coverImage;
  BaReadType readType;
  int payTokens;
  int createId;
  String createBy;
  DateTime createTime;
  int id;

  SpecialResEntity({
    required this.title,
    required this.summary,
    required this.content,
    required this.coverImage,
    required this.readType,
    required this.payTokens,
    required this.createId,
    required this.createBy,
    required this.createTime,
    required this.id,
  });

  factory SpecialResEntity.fromJson(Map<String, dynamic> json) => SpecialResEntity(
        title: json["Title"],
        summary: json["Summary"],
        content: json["Content"],
        coverImage: json["CoverImage"],
        readType: BaReadType.values.firstWhere((e) => e.toString().split('.').last == json["ReadType"], orElse: () => BaReadType.Pub),
        payTokens: json["PayTokens"],
        createId: json["CreateId"],
        createBy: json["CreateBy"],
        createTime: DateTime.parse(json["CreateTime"]),
        id: json["Id"],
      );
}

class SpecialReqEntity {
  String title;
  String summary;
  String coverImage;
  BaReadType readType;
  int payTokens;

  SpecialReqEntity({
    required this.title,
    required this.summary,
    required this.coverImage,
    required this.readType,
    required this.payTokens,
  });

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Summary": summary,
        "CoverImage": coverImage,
        "ReadType": readType.name,
        "PayTokens": payTokens,
      };
}
