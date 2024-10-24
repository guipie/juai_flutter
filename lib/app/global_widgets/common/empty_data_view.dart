import 'package:flutter/material.dart';

import 'app_progress_indicator.dart';

/// 搜索结果为空
class DefaultSearchEmpty extends StatelessWidget {
  const DefaultSearchEmpty({
    super.key,
    this.attachView,
    this.onPressed,
  });

  /// 末尾跟随视图
  final Widget? attachView;

  /// 点击占位图事件
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return EmptyDataPlaceholder(
      text: '没有找到相关结果哦~',
      icon: const Icon(Icons.hourglass_empty),
      attachChild: attachView,
      onTap: onPressed,
    );
  }
}

class DefaultEmptyDataView extends StatelessWidget {
  const DefaultEmptyDataView({
    super.key,
    this.icon,
    this.text,
    this.attachView,
    this.onPressed,
  });

  /// logo
  final Widget? icon;

  ///  文本
  final String? text;

  /// 末尾跟随视图
  final Widget? attachView;

  /// 点击占位图事件
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return EmptyDataPlaceholder(
      text: text ?? '暂无内容',
      attachChild: attachView,
      icon: icon ?? const Icon(Icons.signal_cellular_nodata),
      onTap: onPressed,
    );
  }
}

class LoadingEmptyDataView extends StatelessWidget {
  const LoadingEmptyDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyDataView(
      showLoading: true,
      loadingBuilder: (_) => const LoadingPlaceholder(),
      child: const SizedBox(),
    );
  }
}

class EmptyDataView extends StatelessWidget {
  const EmptyDataView({
    super.key,
    required this.child,
    this.loadingBuilder,
    this.showLoading = false,
    this.emptyBuilder,
    this.showEmpty = false,
    this.backgroundColor,
  });

  final Widget child;
  final WidgetBuilder? loadingBuilder;
  final bool showLoading;
  final WidgetBuilder? emptyBuilder;
  final bool showEmpty;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (showLoading && loadingBuilder != null) {
      return Container(
        color: backgroundColor,
        child: loadingBuilder!(context),
      );
    } else if (showEmpty && emptyBuilder != null) {
      return Container(
        color: backgroundColor,
        child: emptyBuilder!(context),
      );
    }
    return child;
  }
}

class EmptyDataPlaceholder extends StatelessWidget {
  const EmptyDataPlaceholder({
    super.key,
    this.text,
    required this.icon,
    this.attachChild,
    this.onTap,
  });

  final String? text;
  final Widget icon;
  final Widget? attachChild;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: _AnimationContainer(
        child: Align(
          alignment: const Alignment(0, -0.2),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                const SizedBox(height: 12),
                if (text != null)
                  Text(
                    text!,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF999999),
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                if (attachChild != null) attachChild!
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingPlaceholder extends StatelessWidget {
  const LoadingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return _AnimationContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppProgressIndicator.color(
            Theme.of(context).primaryColor,
            size: 30,
          ),
        ],
      ),
    );
  }
}

class _AnimationContainer extends StatefulWidget {
  const _AnimationContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  __AnimationContainerState createState() => __AnimationContainerState();
}

class __AnimationContainerState extends State<_AnimationContainer> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? opacityAnimation;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller!);
    scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(_controller!);
    _controller?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: opacityAnimation!,
        child: ScaleTransition(
          scale: scaleAnimation!,
          child: widget.child,
        ),
      ),
    );
  }
}
