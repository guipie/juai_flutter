import '../../../base.dart';
import '../login_provider.dart';

class PhoneWidget extends ConsumerWidget {
  const PhoneWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loginModel = ref.watch(loginProviderProvider);
    return TextFormField(
      controller: loginModel.value!.textPhoneController,
      decoration: InputDecoration(
        hintText: S.current.phone,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      keyboardType: TextInputType.phone,
      forceErrorText: loginModel.value?.validatorPhoneErrorText,
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 11) {
          'Please enter your name'.i();
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
