import 'base.dart';

class BaseRepository<T> {
  String? listApi;
  Function(Map<String, dynamic>)? fromJsonT;
  String? detailApi;
  String? addApi;
  String? updateApi;
  String? deleteApi;
  String? deleteListApi;
  BaseRepository({this.listApi, this.detailApi, this.addApi, this.updateApi, this.deleteApi, this.deleteListApi, this.fromJsonT});
  Future<List<T>> getList({Map<String, dynamic>? req, String? apiUrl}) async {
    assert(listApi != null && fromJsonT != null, ' listApi is null');
    return (await Api.getList<T>(apiUrl ?? listApi!, queryParameters: req, fromJsonT: fromJsonT)).result ?? [];
  }

  Future<T?> getRouteDetail(String id, {String? apiUrl}) async {
    assert(detailApi != null && fromJsonT != null, ' detailApi is null');
    return (await Api.get<T>(apiUrl ?? detailApi! + id, fromJsonT: fromJsonT)).result;
  }

  Future<T?> getQueryDetail(String id, {String? apiUrl}) async {
    assert(detailApi != null && fromJsonT != null, ' detailApi is null');
    return (await Api.get<T>(apiUrl ?? detailApi!, queryParameters: {'id': id}, fromJsonT: fromJsonT)).result;
  }

  Future<T?> add(Map<String, dynamic> req, {String? apiUrl}) async {
    assert(addApi != null && fromJsonT != null, ' addApi is null');
    return (await Api.post<T>(apiUrl ?? addApi!, data: req, fromJsonT: fromJsonT)).result;
  }

  Future<T?> update(Map<String, dynamic> req, {String? apiUrl}) async {
    assert(updateApi != null && fromJsonT != null, ' updateApi is null');
    return (await Api.post<T>(apiUrl ?? updateApi!, data: req, fromJsonT: fromJsonT)).result;
  }

  Future<bool> delete(String id, {String? apiUrl}) async {
    assert(deleteApi != null && id.isNotEmpty, ' deleteApi is null');
    var res = await Api.post(apiUrl ?? deleteApi!, data: {'id': id});
    return res.code == 200;
  }

  Future<bool> deleteList(List<String> ids, {String? apiUrl}) async {
    assert(deleteListApi != null && ids.isNotEmpty, ' deleteListApi is null');
    var res = await Api.post(apiUrl ?? deleteListApi!, data: {'ids': ids});
    return res.code == 200;
  }
}
