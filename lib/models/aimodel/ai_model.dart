part of 'aimodel_models.dart';

@JsonSerializable()
class AiModel {
  @JsonKey(name: 'modelId')
  String modelId;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'shortName')
  String shortName;
  @JsonKey(name: 'avatarUrl')
  String avatarUrl;
  @JsonKey(name: 'modelType')
  int modelType;
  @JsonKey(name: 'category')
  String category;
  @JsonKey(name: 'maxToken')
  int maxToken;
  @JsonKey(name: 'tags')
  String? tags;
  @JsonKey(name: 'desc')
  String? desc;
  @JsonKey(name: 'settings')
  String? settings;
  AiModel({
    required this.modelId,
    required this.name,
    required this.shortName,
    required this.avatarUrl,
    required this.modelType,
    required this.category,
    required this.maxToken,
    this.tags,
    this.desc,
    this.settings,
  });
  factory AiModel.fromJson(Map<String, dynamic> json) => _$AiModelFromJson(json);
  List<AiModel> fromListJson(List<Map<String, dynamic>> json) => json.map((itemJson) => _$AiModelFromJson(itemJson)).toList();
  Map<String, dynamic> toJson() => _$AiModelToJson(this);
}
