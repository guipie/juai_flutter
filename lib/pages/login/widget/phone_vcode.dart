import '../../../base.dart';
import '../../../components/td/tdesign_flutter.dart';
import '../provider/login_provider.dart';

class PhoneVcodeWidget extends ConsumerWidget {
  const PhoneVcodeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdown = ref.watch(countdownVcodeProvider);
    return TDInput(
      type: TDInputType.normal,
      controller: ref.watch(loginProviderProvider).textPhoneController,
      maxLength: 14,
      hintText: S.current.phone,
      rightBtn: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                width: 0.5,
                height: 24,
                color: TDTheme.of(context).grayColor3,
              ),
            ),
            countdown > 0
                ? TDText(
                    '${S.current.resend}${60 - countdown}s',
                    textColor: TDTheme.of(context).fontGyColor4,
                  )
                : TDText(S.current.send + S.current.vcode, textColor: TDTheme.of(context).brandNormalColor),
          ],
        ),
      ),
      needClear: true,
      onBtnTap: () => ref.read(countdownVcodeProvider.notifier).startCountdown(),
    );
  }
}
