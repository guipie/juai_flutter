import '../../../base.dart';

class LoginModel {
  final String? validatorPhoneErrorText;
  final TextEditingController textPhoneController;
  final TextEditingController textVcodeController;
  final TextEditingController textPasswordController;
  LoginModel(this.validatorPhoneErrorText)
      : textPhoneController = TextEditingController(),
        textVcodeController = TextEditingController(),
        textPasswordController = TextEditingController();
}
