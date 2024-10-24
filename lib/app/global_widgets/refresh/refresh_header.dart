import 'package:flutter/material.dart';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simple_animations/simple_animations.dart';

/// 下拉刷新的动画文字
const _kRefreshText = 'PAY · PARK';

class RefreshHeader extends Header {
  const RefreshHeader({
    super.triggerOffset = 70,
    super.clamping = false,
    super.processedDuration = const Duration(
      milliseconds: 500,
    ),
    this.color,
    this.backgroundColor,
    super.position = IndicatorPosition.above,
    super.safeArea = false,
  });

  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, IndicatorState state) {
    double progress = 0;
    if (state.mode == IndicatorMode.inactive) return const SizedBox();
    Widget child;
    if (state.mode == IndicatorMode.processed) {
      child = PlayAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 0.0),
        duration: const Duration(milliseconds: 200),
        builder: (context, value, child) {
          return _RefreshAnimation(
            progress: value,
            color: color,
          );
        },
      );
    } else {
      if (state.mode == IndicatorMode.ready) {
        progress = (state.offset / (triggerOffset + state.safeOffset)) - 1;
        progress = (1 - progress).clamp(0.0, 1.0);
      } else if (state.mode == IndicatorMode.processing) {
        progress = 1;
      }
      child = _RefreshAnimation(
        progress: progress,
        color: color,
      );
    }
    child = Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: backgroundColor != null
            ? [
                BoxShadow(
                  color: backgroundColor!,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                )
              ]
            : null,
      ),
      height: state.offset,
      child: child,
    );

    if (safeArea) {
      child = Container(
        color: backgroundColor,
        child: SafeArea(
          bottom: false,
          child: child,
        ),
      );
    }

    return child;
  }
}

class _RefreshAnimation extends StatelessWidget {
  const _RefreshAnimation({
    super.key,
    required this.progress,
    this.color,
  });

  final double progress;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: _NameAnimation(
              progress: progress,
              color: color,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Transform.scale(
                scale: progress,
                child: Opacity(
                  opacity: progress,
                  child: SpinKitSquareCircle(
                    size: 22,
                    color: color ?? Colors.blue[200],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NameAnimation extends StatelessWidget {
  const _NameAnimation({
    super.key,
    required this.progress,
    this.color,
  });

  final double progress;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const str = _kRefreshText;
    const d = str.length ~/ 2;
    final a = 0.1 * progress;
    // [-120, -100, -80, -60, 60, 80, 100, 120]
    final List<double> space =
        List.generate(d + 1, (index) => (60 + 20.0 * index));
    final tmp = space.reversed.map((e) => -e).toList() + space;

    final children = List.generate(str.length, (index) {
      double t = 0;
      if (index < d) {
        t = (d - index) * a;
      } else {
        final i = index + 1 - d;
        t = i * a;
      }
      final p = 1 - (t + progress).clamp(0.0, 1.0);

      return Transform.translate(
        offset: Offset(tmp[index] * progress, 0),
        child: Opacity(
          opacity: p,
          child: Text(str[index]),
        ),
      );
    });
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.blue[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
