import 'package:chat_bot/base.dart';
import 'package:flutter/material.dart';

class MouseHoverWidget extends StatefulWidget {
  final Color? hoverColor;
  final Widget child;
  const MouseHoverWidget({super.key, required this.child, this.hoverColor});

  @override
  _MouseHoverWidgetState createState() => _MouseHoverWidgetState();
}

class _MouseHoverWidgetState extends State<MouseHoverWidget> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _mouseEnter(true),
      onExit: (_) => _mouseEnter(false),
      child: AnimatedContainer(
        width: 250,
        height: 100,
        duration: const Duration(milliseconds: 200),
        color: _isHovering ? Colors.red : null,
        child: widget.child,
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    "是否移入：$hovering".e();
    setState(() {
      _isHovering = hovering;
    });
  }
}
