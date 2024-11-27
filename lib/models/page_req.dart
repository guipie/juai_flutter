import '../base.dart';

part 'page_req.g.dart';
part 'page_req.freezed.dart';

@freezed
class PageReq with _$PageReq {
  factory PageReq({
    @Default(1) int page,
    @Default(50) int pageSize,
    DateTime? lastCreate,
    String? searchKey,
  }) = _PageReq;
  // 工厂构造函数
  factory PageReq.fromJson(Map<String, dynamic> json) => _$PageReqFromJson(json);
}
