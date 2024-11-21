import '../../../base.dart';

class VcodeWidget extends StatelessWidget {
  const VcodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: S.current.vcode,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
      ),
      keyboardType: TextInputType.number,
      forceErrorText: '错误',
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 11) {
          return 'Please enter your name';
        }
        return null;
      },
      onSaved: (phone) {
        phone.e();
      },
    );
  }
}
