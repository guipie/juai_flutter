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
      child: Container(
        color: _isHovering ? Theme.of(context).dividerTheme.color : null,
        child: widget.child,
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
  }
}
