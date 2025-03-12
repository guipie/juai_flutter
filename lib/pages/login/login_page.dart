import 'package:fluent_ui/fluent_ui.dart' as fl;

import '../../base/base.dart';
import '../../base/base_page.dart';
import '../../components/image/image.dart';
import '../../constants/enums/user_enum.dart';
import '../home/view_model/home_view_model.dart';
import 'provider/login_provider.dart';
import 'widget/invitation_code.dart';
import 'widget/password.dart';
import 'widget/phone.dart';
import 'widget/vcode.dart';

class LoginPage extends BasePage {
  LoginPage({this.loginOpr = LoginOpr.login, super.key})
      : _curTitle = loginOpr == LoginOpr.register
            ? S.current.register
            : loginOpr == LoginOpr.forget
                ? S.current.forget_password
                : S.current.login;

  final _formKey = GlobalKey<FormState>();
  final LoginOpr loginOpr;
  final String _curTitle;

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: fl.FluentTheme.of(context).scaffoldBackgroundColor,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 设置 mainAxisSize 为 min
              children: [
                SizedBox(height: constraints.maxHeight * 0.1),
                const JuImage(Assets.imageBgTm),
                // SizedBox(height: constraints.maxHeight * 0.1),
                Text(
                  _curTitle,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (loginOpr == LoginOpr.login) ...[
                        const PhoneWidget(),
                        const PassWordWidget(),
                      ],
                      if (loginOpr != LoginOpr.login) ...[
                        const PhoneWidget(
                          isVcode: true,
                        ),
                        const VcodeWidget(),
                        const SizedBox(height: 16.0),
                        const InvitationCodeWidget(),
                        const SizedBox(height: 16.0),
                      ],
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            '验证成功'.i();
                            _formKey.currentState!.save();
                            ref.read(loginProviderProvider.notifier).toLoginRegister(loginOpr);
                            // Navigate to the main screen
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFF00BF6D).withAlpha(ref.watch(loginProviderProvider).isLogining ? 120 : 255),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 48),
                          shape: const StadiumBorder(),
                        ),
                        icon: ref.watch(loginProviderProvider).isLogining
                            ? SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColorDark),
                                ),
                              )
                            : null,
                        label: Text(loginOpr == LoginOpr.login ? S.current.login : S.current.validate),
                      ),
                      const SizedBox(height: 9.0),
                      if (loginOpr == LoginOpr.login) ...[
                        TextButton(
                          onPressed: () {
                            F.push(LoginPage(loginOpr: LoginOpr.forget));
                          },
                          child: Text(
                            S.current.forget_password,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
                                ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            F.push(LoginPage(loginOpr: LoginOpr.register));
                          },
                          child: Text.rich(
                            TextSpan(
                              text: S.current.no_account,
                              children: [
                                TextSpan(
                                  text: S.current.register,
                                  style: const TextStyle(color: Color(0xFF00BF6D)),
                                ),
                              ],
                            ),
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context).textTheme.bodyLarge!.color!.withAlpha(64),
                                ),
                          ),
                        ),
                      ],
                      if (loginOpr != LoginOpr.login)
                        TextButton(
                          onPressed: () {
                            F.pushAndRemoveUntil(LoginPage(loginOpr: LoginOpr.login));
                          },
                          child: Text(
                            '${S.current.have_account},${S.current.login}',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context).textTheme.bodyLarge!.color!.withAlpha(64),
                                ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  // TODO: implement title
  String get title => _curTitle;
}
