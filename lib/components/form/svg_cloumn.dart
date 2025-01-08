import 'package:flutter_svg/svg.dart';

import '../../base/base.dart';

Widget svgCloumn(
  String svgUrl,
  String text,
  WidgetRef ref, {
  double width = 36,
  double height = 36,
  String? desc,
  Color color = Colors.green,
}) {
  return Column(
    children: [
      SvgPicture.asset(
        svgUrl,
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
      RichText(
        text: TextSpan(
          style: TextStyle(color: ref.watch(themeProvider).secondColor()),
          children: [
            TextSpan(text: text),
            if (desc != null)
              TextSpan(
                text: desc,
                style: TextStyle(
                  color: ref.watch(themeProvider).secondColor(),
                  fontSize: ref.watch(themeProvider).fsSm,
                ),
              ),
          ],
        ),
      ),
    ],
  );
}
