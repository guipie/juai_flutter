import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;

import '../../base/base.dart';

class JuFormRow extends ConsumerWidget {
  const JuFormRow(
    this.text, {
    Key? key,
    this.border = true,
    this.right,
    this.prefix,
    this.isMustRight = true,
    this.onTap,
  }) : super(key: key);

  /// 底部 border 是否显示
  final bool border;

  final String text;

  /// 右侧内容
  final Widget? right;
  //前缀组件
  final Widget? prefix;
  final bool isMustRight;

  /// 点击回调
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Ink(
      decoration: BoxDecoration(
        color: fl.FluentTheme.of(context).activeColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: .6, color: border ? ref.watch(themeProvider).divideBgColor() : Colors.transparent),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (prefix != null) prefix!,
              Text(
                text,
                style: TextStyle(
                  fontSize: ref.watch(themeProvider).fsL,
                ),
              ),
              const Spacer(),
              right ?? const SizedBox.shrink(),
              if (isMustRight == true)
                Icon(
                  Icons.arrow_forward_ios,
                  size: ref.watch(themeProvider).fsXl,
                  color: ref.watch(themeProvider).secondColor(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
