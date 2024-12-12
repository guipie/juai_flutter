import '../base.dart';
import '../components/td/src/util/log.dart';

class BaseRepository<T> {
  String? listApi;
  Function(Map<String, dynamic>)? fromJsonT;
  String? detailApi;
  String? addApi;
  String? updateApi;
  String? deleteApi;
  BaseRepository({this.listApi, this.detailApi, this.addApi, this.updateApi, this.deleteApi, this.fromJsonT});
  Future<List<T>> getList({Map<String, dynamic>? req, String? apiUrl}) async {
    assert(listApi != null && fromJsonT != null, ' listApi is null');
    return (await Api.getList<T>(apiUrl ?? listApi!, queryParameters: req, fromJsonT: fromJsonT)).result ?? [];
  }
}
