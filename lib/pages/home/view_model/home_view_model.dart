import 'package:fluent_ui/fluent_ui.dart';
import '../../../base/base.dart';
import '../state/home_state.dart';

part 'home_view_model.g.dart';

@Riverpod(keepAlive: true)
class HomeVm extends _$HomeVm {
  @override
  HomeState build() {
    return HomeState.init();
  }

  void setCurTabIndex(int index) {
    state = state.copyWith(curTabIndex: index);
  }

  void setHomePcTitle(String title) {
    state = state.copyWith(homePcTitle: title);
  }
}
