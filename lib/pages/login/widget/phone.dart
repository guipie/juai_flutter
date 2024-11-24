import '../../../base.dart';
import '../provider/login_provider.dart';

class PhoneWidget extends ConsumerWidget {
  const PhoneWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loginModel = ref.watch(loginProviderProvider);
    return TextFormField(
      controller: loginModel.textPhoneController,
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
      validator: (value) {
        if (value == null || value.isEmpty || !value.toRegMath(Regs.phoneRegExp)) {
          return S.current.please_input + S.current.true_ + S.current.phone;
        }
        return null;
      },
    );
  }
}
