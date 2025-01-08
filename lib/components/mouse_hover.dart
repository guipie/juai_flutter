import '../base/base.dart';
import 'package:flutter/material.dart';

class MouseHoverWidget extends StatefulWidget {
  final Color? hoverColor;
  final Color? color;
  final Widget child;
  final Function()? onTap;
  final bool isRadius;
  const MouseHoverWidget({super.key, required this.child, this.hoverColor, this.color, this.onTap, this.isRadius = true});

  @override
  _MouseHoverWidgetState createState() => _MouseHoverWidgetState();
}

class _MouseHoverWidgetState extends State<MouseHoverWidget> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap?.call();
      },
      onHover: _mouseEnter,
      hoverColor: widget.hoverColor,
      mouseCursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: widget.isRadius ? BorderRadius.circular(6) : null,
          color: _isHovering ? (widget.hoverColor ?? Theme.of(context).dividerTheme.color) : widget.color,
        ),
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
