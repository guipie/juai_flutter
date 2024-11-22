import '../../base.dart';
import 'model/login_model.dart';

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

  String get countdownText => '${60 - state}s';
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
  FutureOr<LoginModel> build() async {
    return LoginModel('');
  }

  void setLoginPhone(String phone) {}
}
