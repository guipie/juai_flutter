class PagingParams {
  int? lastId;
  int size = 10;
  Map<String, dynamic> model = {};
  PagingParams();
  factory PagingParams.create({required int? lastId}) {
    var params = PagingParams();
    params.lastId = lastId;
    return params;
  }
}
