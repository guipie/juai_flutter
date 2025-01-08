import '../../../base/base.dart';
import '../provider/login_provider.dart';

class PhoneWidget extends ConsumerWidget {
  const PhoneWidget({super.key, this.isVcode = false});
  final bool isVcode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loginModel = ref.watch(loginProviderProvider);
    return TextFormField(
      controller: loginModel.textPhoneController,
      decoration: InputDecoration(
        hintText: S.current.phone,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 8.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        suffixIconConstraints: const BoxConstraints(maxHeight: 34),
        suffixIcon: isVcode
            ? ref.watch(countdownVcodeProvider) > 0
                ? Text(
                    '${S.current.resend}${60 - ref.watch(countdownVcodeProvider)}s  ',
                  )
                : FilledButton(
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    ),
                    onPressed: () => ref.read(countdownVcodeProvider.notifier).startCountdown(),
                    child: Text(S.current.vcode),
                  )
            : null,
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
