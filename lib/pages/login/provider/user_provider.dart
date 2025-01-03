import '../../../base.dart';
import '../../aimodel/view_model/aimodel_view_model.dart';
import '../../home/home_page.dart';
import '../../home/home_pc_page.dart';
import '../login_page.dart';
import '../model/login_res_model.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class CurentUser extends _$CurentUser {
  @override
  LoginResModel build() {
    return SpUtil.getObj<LoginResModel>(CacheKeys.curUser, (Map<dynamic, dynamic> json) => LoginResModel.fromJson(json.cast<String, dynamic>()), defValue: const LoginResModel())!;
  }

  void setUser(LoginResModel user) {
    SpUtil.putObject(CacheKeys.curUser, user);
    SpUtil.putString(CacheKeys.accessToken, user.accessToken!);
    SpUtil.putString(CacheKeys.refreshToken, user.refreshToken!);
    state = user;
  }

  void clear() {
    state = const LoginResModel();
  }

  String getPhone() {
    return state.phone ?? '';
  }

  int? getUserId() {
    return state.userId;
  }

  bool get isLogin => state.accessToken != null && (state.userId ?? 0) > 0 && (state.phone?.isNotEmpty ?? false);

  Future<void> verifyLogin() async {
    if (isLogin) {
      ref.watch(aiModelVmProvider.notifier);
      if (F.isRootPage)
        F.pop();
      else
        await F.pushAndRemoveUntil(F.pc ? const HomePcPage() : const HomePage());
    } else
      await F.pushAndRemoveUntil(LoginPage());
  }
}
