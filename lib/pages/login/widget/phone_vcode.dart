import '../../../base.dart';
import '../../../components/td/tdesign_flutter.dart';
import '../login_provider.dart';

class PhoneVcodeWidget extends ConsumerWidget {
  const PhoneVcodeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdown = ref.watch(countdownVcodeProvider);
    return TDInput(
      type: TDInputType.normal,
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
                    '${S.current.resend}(${ref.read(countdownVcodeProvider.notifier).countdownText})',
                    textColor: TDTheme.of(context).fontGyColor4,
                  )
                : TDText(S.current.send + S.current.vcode, textColor: TDTheme.of(context).brandNormalColor),
          ],
        ),
      ),
      needClear: false,
      onBtnTap: () => ref.read(countdownVcodeProvider.notifier).startCountdown(),
    );
  }
}