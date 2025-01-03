import '../constants/theme.dart';
import 'package:lottie/lottie.dart';

import '../base.dart';

class LottieWidget extends ConsumerWidget {
  final double scale;
  final bool transformHitTests;
  final double width;

  const LottieWidget({super.key, required this.scale, required this.transformHitTests, required this.width});

  @override
  Widget build(BuildContext context, ref) {
    var color = ref.watch(primaryColorProvider);
    return Stack(
      children: [
        Transform.scale(
          scale: scale,
          transformHitTests: transformHitTests,
          child: Lottie.asset(
            'assets/lottie/audio.json',
            width: width,
            delegates: LottieDelegates(
              values: [
                ValueDelegate.color(
                  const [
                    '**',
                  ],
                  value: color,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Icon(
              Icons.mic,
              color: Colors.white,
              size: width / 2.8,
            ),
          ),
        ),
      ],
    );
  }
}
