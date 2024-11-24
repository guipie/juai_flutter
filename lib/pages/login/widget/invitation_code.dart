import '../../../base.dart';
import '../../../components/td/tdesign_flutter.dart';
import '../provider/login_provider.dart';
import '../model/login_model.dart';

class InvitationCodeWidget extends ConsumerWidget {
  const InvitationCodeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loginModel = ref.watch(loginProviderProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (loginModel.invitaionCodeShow)
          Expanded(
            child: TDInput(
              type: TDInputType.normal,
              controller: ref.watch(loginProviderProvider).textVcodeController,
              hintText: S.current.invitation_code_input,
              needClear: false,
            ),
          ),
        TDSwitch(
          type: TDSwitchType.text,
          isOn: loginModel.invitaionCodeShow,
          openText: S.current.invitation_code,
          closeText: S.current.invitation_code,
          onChanged: (value) {
            ref.read(loginProviderProvider.notifier).setInvitaionCode(value);
            return false;
          },
        )
      ],
    );
  }
}
