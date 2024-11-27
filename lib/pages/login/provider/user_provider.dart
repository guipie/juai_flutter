import '../../../base.dart';
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
    Config.accessToken = user.accessToken!;
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

  Future<void> verifyLogin() async {
    var login = state.accessToken != null && (state.userId ?? 0) > 0 && state.phone!.isNotEmpty;
    if (login) {
      Config.accessToken = state.accessToken!;
      await F.pushAndRemoveUntil(F.pc ? const HomePcPage() : const HomePage());
    } else
      await F.pushAndRemoveUntil(LoginPage());
  }
}
