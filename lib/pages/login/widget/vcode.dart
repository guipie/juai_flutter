import '../../../base.dart';
import '../../../components/td/tdesign_flutter.dart';
import '../provider/login_provider.dart';

class VcodeWidget extends ConsumerStatefulWidget {
  const VcodeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VcodeWidgetState();
}

class _VcodeWidgetState extends ConsumerState<VcodeWidget> {
  @override
  Widget build(BuildContext context) {
    return TDInput(
      type: TDInputType.normal,
      controller: ref.watch(loginProviderProvider).textVcodeController,
      hintText: S.current.vcode,
      needClear: true,
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
