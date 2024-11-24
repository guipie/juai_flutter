import '../../../base.dart';

class LoginModel {
  bool invitaionCodeShow;
  final TextEditingController textPhoneController;
  final TextEditingController textVcodeController;
  final TextEditingController textPasswordController;
  final TextEditingController textInvitationCodeController;
  LoginModel({this.invitaionCodeShow = false})
      : textPhoneController = TextEditingController(),
        textVcodeController = TextEditingController(),
        textInvitationCodeController = TextEditingController(),
        textPasswordController = TextEditingController();
}
