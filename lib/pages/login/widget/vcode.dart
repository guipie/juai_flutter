import 'package:fluent_ui/fluent_ui.dart' as fl;

import '../../../base.dart';
import '../provider/login_provider.dart';

class VcodeWidget extends ConsumerStatefulWidget {
  const VcodeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VcodeWidgetState();
}

class _VcodeWidgetState extends ConsumerState<VcodeWidget> {
  @override
  Widget build(BuildContext context) {
    return fl.TextBox(
      controller: ref.watch(loginProviderProvider).textVcodeController,
      placeholder: S.current.vcode,
      onChanged: (text) {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
