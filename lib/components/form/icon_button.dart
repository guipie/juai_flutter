import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatefulWidget {
  const IconButtonWidget({super.key, required this.icon, required this.text});
  final Icon icon;
  final String text;
  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        elevation: 0.1,
        alignment: Alignment.center,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // 确保行只占用所需的空间
        children: <Widget>[
          widget.icon, // 图标
          const SizedBox(width: 2), // 调整这个值来改变图标和文本间的距离
          Text(widget.text), // 文本
        ],
      ),
    );
  }
}
