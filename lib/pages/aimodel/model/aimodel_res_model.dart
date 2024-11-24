import 'package:json_annotation/json_annotation.dart';
part 'aimodel_res_model.g.dart';

@JsonSerializable()
class AiModelRes {
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
  AiModelRes({
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
  factory AiModelRes.fromJson(Map<String, dynamic> json) => _$AiModelResFromJson(json);
  Map<String, dynamic> toJson() => _$AiModelResToJson(this);
}

class AiModelSort {
  String key;
  List<AiModelRes> models;
  AiModelSort({required this.key, required this.models});
}
