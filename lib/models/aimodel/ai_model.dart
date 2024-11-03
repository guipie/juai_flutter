part of 'aimodel_models.dart';

@JsonSerializable()
class AiModel {
  String modelId;
  String name;
  String shortName;
  String avatarUrl;
  int modelType;
  String category;
  int maxToken;
  String tags;
  String desc;
  String settings;
  AiModel({
    required this.modelId,
    required this.name,
    required this.shortName,
    required this.avatarUrl,
    required this.modelType,
    required this.category,
    required this.maxToken,
    required this.tags,
    required this.desc,
    required this.settings,
  });
  factory AiModel.fromJson(Map<String, dynamic> json) => _$AiModelFromJson(json);
  Map<String, dynamic> toJson() => _$AiModelToJson(this);
}
