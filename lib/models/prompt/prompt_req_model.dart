import '../../base/base.dart';
part 'prompt_req_model.freezed.dart';
part 'prompt_req_model.g.dart';

enum PromptReqCategoryType {
  all,
  my,
  collection,
}

@freezed
class PromptReq with _$PromptReq {
  const factory PromptReq({
    @Default(1) int page,
    @Default(10) int pageSize,
    DateTime? lastCreate,
    String? searchKey,
    @Default(PromptReqCategoryType.all) PromptReqCategoryType? category,
  }) = _PromptReq;

  factory PromptReq.fromJson(Map<String, dynamic> json) => _$PromptReqFromJson(json);
}
