import 'package:fluent_ui/fluent_ui.dart' as fl;

import '../../../base.dart';
import '../provider/login_provider.dart';

class PhoneVcodeWidget extends ConsumerWidget {
  const PhoneVcodeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdown = ref.watch(countdownVcodeProvider);
    return Row(
      children: [
        Expanded(
          child: fl.TextBox(
            controller: ref.watch(loginProviderProvider).textPhoneController,
            keyboardType: TextInputType.number,
            placeholder: S.current.phone,
          ),
        ),
        // const Padding(
        //   padding: EdgeInsets.only(right: 16),
        //   child: SizedBox(
        //     width: 0.5,
        //     height: 24,
        //   ),
        // ),
        countdown > 0
            ? Text(
                '${S.current.resend}${60 - countdown}s',
              )
            : fl.FilledButton(
                child: Text(S.current.send + S.current.vcode),
                onPressed: () => ref.read(countdownVcodeProvider.notifier).startCountdown(),
              ),
      ],
    );
  }
}
