import '../../../base/base.dart';

class LoginModel {
  bool invitaionCodeShow;
  final TextEditingController textPhoneController;
  final TextEditingController textVcodeController;
  final TextEditingController textPasswordController;
  final TextEditingController textInvitationCodeController;
  final bool isLogining;
  LoginModel({this.invitaionCodeShow = false, this.isLogining = false})
      : textPhoneController = TextEditingController(),
        textVcodeController = TextEditingController(),
        textInvitationCodeController = TextEditingController(),
        textPasswordController = TextEditingController();
  LoginModel copyWith({
    bool? invitaionCodeShow,
    bool? isLogining,
  }) {
    return LoginModel(
      invitaionCodeShow: invitaionCodeShow ?? this.invitaionCodeShow,
      isLogining: isLogining ?? this.isLogining,
    );
  }
}
