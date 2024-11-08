import '../base.dart';
import 'package:flutter/material.dart';

class MouseHoverWidget extends StatefulWidget {
  final Color? hoverColor;
  final Color? color;
  final Widget child;
  const MouseHoverWidget({super.key, required this.child, this.hoverColor, this.color});

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
        color: _isHovering ? (widget.hoverColor ?? Theme.of(context).dividerTheme.color) : widget.color,
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
