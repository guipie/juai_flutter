import '../../../base.dart';
import '../../../components/td/tdesign_flutter.dart';

class VcodeWidget extends StatelessWidget {
  const VcodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TDInput(
      type: TDInputType.normal,
      hintText: S.current.phone,
      needClear: false,
    );
  }
}
