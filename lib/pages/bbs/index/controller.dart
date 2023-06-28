import 'package:juai/common/utils/base_page/base_page_controller.dart';
import 'package:juai/common/utils/base_page/base_page_params.dart';
import 'package:juai/entities/api_response.dart';
import 'package:juai/entities/content/content.dart';
import 'package:juai/pages/bbs/index/state.dart';

class BbsIndexController extends PagingController<ContentResEntity, BbsIndexState> {
  BbsIndexController();
  @override
  BbsIndexState getState() => BbsIndexState();

  @override
  Future<List<ContentResEntity>?> loadData(PagingParams pagingParams) async {
    return ContentAPI.contentList(lastId: pagingParams.lastId);
  }
}
