import 'package:dart_sm/dart_sm.dart';

import '../../../base/base.dart';
import '../../../constants/enums/user_enum.dart';
import '../../home/home_page.dart';
import '../../splash_page.dart';
import '../login_page.dart';
import '../model/login_model.dart';
import '../model/login_req_model.dart';
import '../model/login_res_model.dart';
import 'user_provider.dart';

part 'login_provider.g.dart';

@riverpod
class CountdownVcode extends _$CountdownVcode {
  @override
  int build() {
    return 0;
  }

  void countdown() {
    state = state + 1;
  }

  void reset() {
    state = 0;
  }

  void startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      state = state + 1;
      if (state < 60) {
        startCountdown();
      } else {
        reset();
      }
    });
  }
}

@riverpod
class LoginProvider extends _$LoginProvider {
  @override
  LoginModel build() {
    return LoginModel();
  }

  void setInvitaionCode(bool val) {
    state = LoginModel(invitaionCodeShow: val);
  }

  Future<void> toLoginRegister(LoginOpr opr) async {
    if (state.isLogining) return;
    var req = LoginReqModel(account: state.textPhoneController.text);
    if (opr == LoginOpr.login) {
      req = req.copyWith(password: SM2.encrypt(state.textPasswordController.text, Constant.pubKey));
    } else {
      req = req.copyWith(code: state.textVcodeController.text);
      req = req.copyWith(u: state.textInvitationCodeController.text);
    }
    state = state.copyWith(isLogining: true);
    var loginReponse = await Api.post<LoginResModel>(ApisUser.login, data: req.toJson(), fromJsonT: LoginResModel.fromJson).catchError((err) {
      state = state.copyWith(isLogining: false);
      throw Future.error(err);
    });
    state = state.copyWith(isLogining: false);
    if (loginReponse.isSuccess && loginReponse.result!.accessToken!.isNotEmpty) {
      ref.read(curentUserProvider.notifier).setUser(loginReponse.result!);
      await ref.read(curentUserProvider.notifier).verifyLogin();
    }
  }

  Future<void> toLogout() async {
    ref.read(curentUserProvider.notifier).clear();
    await F.pushAndRemoveUntil(LoginPage());
  }
}
