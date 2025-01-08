import '../../../base/base.dart';
import '../provider/login_provider.dart';

class PassWordWidget extends ConsumerWidget {
  const PassWordWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        controller: ref.read(loginProviderProvider).textPasswordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: S.current.pwd,
          filled: true,
          fillColor: const Color(0xFFF5FCF9),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 8.0),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.current.please_input + S.current.pwd;
          }
          return null;
        },
      ),
    );
  }
}
