import 'package:freezed_annotation/freezed_annotation.dart';
part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
class ConversationModel with _$ConversationModel {
  const factory ConversationModel({int? id, String? name, String? avatar, String? desc, DateTime? createTime, DateTime? lastTime, double? isUnReadCnt}) = _ConversationModel;
  factory ConversationModel.fromJson(Map<String, dynamic> json) => _$ConversationModelFromJson(json);
  factory ConversationModel.init() => ConversationModel(id: 1, name: "", avatar: "", desc: "", createTime: DateTime.now(), lastTime: DateTime.now(), isUnReadCnt: 0.56);
}
