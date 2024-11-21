import '../../../base.dart';

class PhoneModel {
  final String? validatorErrorText;
  final TextEditingController textController;
  PhoneModel(this.validatorErrorText) : textController = TextEditingController();
}
