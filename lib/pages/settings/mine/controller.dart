import 'package:JuAI/common/apis/apis.dart';
import 'package:JuAI/pages/settings/mine/state.dart';
import 'package:get/get.dart';

class SettingsMineHomeController extends GetxController {
  final state = SettingsMineHomeState();
  @override
  void onInit() {
    _getMyContents(true);
    super.onInit();
  }

  void _getMyContents(bool isFirst) {
    int? lastId;
    if (isFirst || state.items.isEmpty) {
      lastId = null;
      state.items.clear();
    } else {
      lastId = state.items.last.id;
    }
    ContentAPI.myContentList(lastId: lastId).then((value) => state.items.value = value);
  }
}
