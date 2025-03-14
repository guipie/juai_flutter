import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'view_model/home_view_model.dart';

class BottomNavItem extends ConsumerWidget {
  final bool checked;
  final int index;
  final String? label;
  final IconData icon;
  final IconData iconChecked;
  final Function? click;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.iconChecked,
    required this.checked,
    required this.index,
    this.label,
    this.click,
  });

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        ref.read(homeVmProvider.notifier).setCurTabIndex(index);
        click?.call();
      },
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              checked ? iconChecked : icon,
              color: checked ? fl.FluentTheme.of(context).accentColor : null,
            ),
            Text(label ?? '', style: checked ? Theme.of(context).textTheme.titleSmall!.copyWith(color: fl.FluentTheme.of(context).accentColor) : Theme.of(context).textTheme.bodySmall),
            // Container(
            //   decoration: BoxDecoration(
            //     color: checked
            //         ? Theme.of(context).primaryColor
            //         : Colors.transparent,
            //     borderRadius: BorderRadius.circular(5),
            //   ),
            //   height: 3,
            //   width: 30,
            // )
          ],
        ),
      ),
    );
  }
}

class BottomNavPainter extends CustomPainter {
  final Color bgColor;

  BottomNavPainter({this.bgColor = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    //绘制矩形，然后顶部中间是个半圆
    var paint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTRB(0, kBottomNavigationBarHeight / 2, size.width, size.height), paint);

    canvas.drawCircle(Offset(size.width / 2, kBottomNavigationBarHeight), kBottomNavigationBarHeight / 1.35, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
