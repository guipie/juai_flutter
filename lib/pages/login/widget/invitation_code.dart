import '../../../base.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
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
            child: fl.TextBox(
              controller: ref.watch(loginProviderProvider).textVcodeController,
              placeholder: S.current.invitation_code_input,
            ),
          ),
        fl.ToggleSwitch(
          checked: loginModel.invitaionCodeShow,
          content: Text(S.current.invitation_code),
          onChanged: (value) {
            ref.read(loginProviderProvider.notifier).setInvitaionCode(value);
          },
        )
      ],
    );
  }
}
