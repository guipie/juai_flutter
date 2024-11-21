import '../../base.dart';
import '../../components/image.dart';
import '../../components/td/tdesign_flutter.dart';
import '../../constants/enums/user_enum.dart';
import 'widget/password.dart';
import 'widget/phone.dart';
import 'widget/phone_vcode.dart';
import 'widget/vcode.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginPage({this.loginOpr = LoginOpr.login, super.key});
  final LoginOpr loginOpr;
  @override
  Widget build(BuildContext context) {
    var text = S.current.login;
    if (loginOpr == LoginOpr.register)
      text = S.current.register;
    else if (loginOpr == LoginOpr.forget) text = S.current.forget_password;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: JuAppBar.baseBar(text: text),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  const JuImage(Assets.imageLogo),
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Text(
                    S.current.login,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        if (loginOpr == LoginOpr.login) ...[
                          const PhoneWidget(),
                          const PassWordWidget(),
                        ],
                        if (loginOpr != LoginOpr.login) ...[
                          const PhoneVcodeWidget(),
                          const VcodeWidget(),
                        ],
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              '验证成功'.i();
                              _formKey.currentState!.save();
                              // Navigate to the main screen
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFF00BF6D),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 48),
                            shape: const StadiumBorder(),
                          ),
                          child: Text(S.current.login),
                        ),
                        const SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () {
                            F.push(LoginPage(loginOpr: LoginOpr.register));
                          },
                          child: Text(
                            S.current.forget_password,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
                                ),
                          ),
                        ),
                        if (loginOpr == LoginOpr.login)
                          TextButton(
                            onPressed: () {
                              F.push(LoginPage(loginOpr: LoginOpr.forget));
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
                                    color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
