import '../base.dart';

class PageReq {
  final int page;
  final int pageSize;
  final DateTime? lastCreate;
  final String? searchKey;
  PageReq(
    this.page,
    this.pageSize,
    this.lastCreate,
    this.searchKey,
  );
}
