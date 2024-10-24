import 'dart:math';

import 'package:flutter/material.dart';

class AppProgressIndicator extends StatefulWidget {
  AppProgressIndicator.color(
    Color color, {
    super.key,
    this.duration = const Duration(milliseconds: 1000),
    this.lineWidth = 2,
    this.size = 40,
    this.value,
    this.animating = true,
  })  : color1 = color.withOpacity(0),
        color2 = color;

  const AppProgressIndicator({
    super.key,
    this.duration = const Duration(milliseconds: 1000),
    this.color1,
    this.color2,
    this.lineWidth = 2,
    this.size = 50,
    this.value,
    this.animating = true,
  });

  /// 动画时间，默认 = 1s
  final Duration duration;

  /// 颜色，进度背景颜色
  final Color? color1;

  /// 颜色，进度值颜色
  final Color? color2;

  /// 线条宽度，默认 = 2
  final double lineWidth;

  /// 大小，默认 = 50
  final double size;

  /// 进度值
  final double? value;

  /// 是否开启动画
  final bool animating;

  @override
  State<AppProgressIndicator> createState() => _AppProgressIndicatorState();
}

class _AppProgressIndicatorState extends State<AppProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  Animation<double>? _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation =
        Tween<double>(begin: pi * 1.5, end: pi * 3.5).animate(_controller!);
    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(_controller!);
    if (widget.value == null) {
      if (widget.animating) _controller?.repeat();
    } else {
      _controller?.animateTo(
        widget.value!,
        duration: const Duration(milliseconds: 100),
      );
    }
  }

  @override
  void didUpdateWidget(AppProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null) {
      if (_controller!.isAnimating && !widget.animating) {
        _controller?.stop();
      } else if (!_controller!.isAnimating && widget.animating) {
        _controller?.repeat();
      }
    } else {
      if (_controller!.isAnimating) _controller?.stop();
      _controller?.animateTo(
        widget.value!,
        duration: const Duration(milliseconds: 100),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color1 = widget.color1 ?? Colors.white.withOpacity(0.1);
    Color color2 = widget.color2 ?? Colors.black;

    if (widget.value == null) {
      return _buildIndicator(
        color1: color1,
        color2: color2,
      );
    }
    return _buildAppProgressIndicator(
      color1: color1,
      color2: color2,
    );
  }

  Widget _buildIndicator({
    required Color color1,
    required Color color2,
  }) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation!.value,
          child: child,
        );
      },
      child: CustomPaint(
        painter: AppProgressIndicatorPainter(
          color1: color1,
          color2: color2,
          strokWidth: widget.lineWidth,
        ),
        size: Size(widget.size, widget.size),
      ),
    );
  }

  Widget _buildAppProgressIndicator({
    required Color color1,
    required Color color2,
  }) {
    return Transform.rotate(
      angle: pi * 1.5,
      child: AnimatedBuilder(
        animation: _animation!,
        builder: (context, child) {
          return CustomPaint(
            painter: AppProgressIndicatorPainter(
              color1: color1,
              color2: color2,
              value: _progressAnimation!.value,
              strokWidth: widget.lineWidth,
            ),
            size: Size(widget.size, widget.size),
          );
        },
      ),
    );
  }
}

class AppProgressIndicatorPainter extends CustomPainter {
  const AppProgressIndicatorPainter({
    required this.color1,
    required this.color2,
    this.strokWidth = 2,
    this.value,
  });

  final Color color1;

  final Color color2;

  final double strokWidth;

  final double? value;

  @override
  void paint(Canvas canvas, Size size) {
    Rect arcRect = Rect.fromCircle(
      center: Offset(size.width * 0.5, size.height * 0.5),
      radius: (size.width - strokWidth) * 0.5,
    );
    if (value == null) {
      // 无限转圈模式
      List<Color> colors = [color1, color2];
      Gradient gradient = SweepGradient(colors: colors);

      Paint paint = Paint();
      paint.strokeWidth = strokWidth;
      paint.style = PaintingStyle.stroke;
      paint.strokeCap = StrokeCap.round;
      paint.shader = gradient.createShader(arcRect);
      canvas.drawArc(arcRect, 0.1, pi * 1.95, false, paint);
      return;
    }

    // 进度模式
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.color = color1;
    paint.strokeWidth = strokWidth;
    paint.strokeCap = StrokeCap.round;
    canvas.drawArc(arcRect, 0, pi * 2, false, paint);

    Paint paint1 = Paint();
    paint1.style = PaintingStyle.stroke;
    paint1.color = color2;
    paint1.strokeWidth = strokWidth;
    paint1.strokeCap = StrokeCap.round;
    canvas.drawArc(arcRect, 0, pi * value! * 2, false, paint1);
  }

  @override
  bool shouldRepaint(AppProgressIndicatorPainter oldDelegate) {
    return oldDelegate.color1 != color1 ||
        oldDelegate.color2 != color2 ||
        oldDelegate.strokWidth != strokWidth ||
        oldDelegate.value != strokWidth;
  }
}
