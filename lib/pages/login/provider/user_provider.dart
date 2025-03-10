import '../../../base/base.dart';
import '../../../constants/sp_keys.dart';
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
    try {
      return SpUtil.getObj<LoginResModel>(SpKeys.curUser, (Map<dynamic, dynamic> json) => LoginResModel.fromJson(json.cast<String, dynamic>()), defValue: const LoginResModel())!;
    } catch (e) {
      e.e();
      verifyLogin();
      return const LoginResModel();
    }
  }

  void setUser(LoginResModel user) {
    SpUtil.putObject(SpKeys.curUser, user);
    SpUtil.putString(SpKeys.accessToken, user.accessToken!);
    SpUtil.putString(SpKeys.refreshToken, user.refreshToken!);
    state = user;
  }

  void clear() {
    state = const LoginResModel();
    SpUtil.remove(SpKeys.curUser);
    SpUtil.remove(SpKeys.accessToken);
    SpUtil.remove(SpKeys.refreshToken);
  }

  // String get phone => state.phone ?? '';
  // int? get userId => state.userId;

  bool isLogin() => state.accessToken != null && (state.userId ?? 0) > 0 && (state.phone?.isNotEmpty ?? false);

  Future<void> verifyLogin() async {
    if (isLogin()) {
      ref.watch(aiModelVmProvider.notifier);
      if (F.isRootPage)
        F.pop();
      else
        await F.pushAndRemoveUntil(F.pc ? const HomePcPage() : const HomePage());
    } else
      await F.pushAndRemoveUntil(LoginPage());
  }
}
