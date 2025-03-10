import 'package:fluent_ui/fluent_ui.dart' as fl;

import '../../../base/base.dart';
import '../provider/login_provider.dart';

class VcodeWidget extends ConsumerStatefulWidget {
  const VcodeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VcodeWidgetState();
}

class _VcodeWidgetState extends ConsumerState<VcodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: ref.watch(loginProviderProvider).textVcodeController,
        decoration: InputDecoration(
          hintText: S.current.vcode,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 4.0),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty || value.length != 4) {
            return S.current.please_input + S.current.true_ + S.current.vcode;
          }
          return null;
        },
        onChanged: (text) {
          setState(() {});
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
