import 'package:juai/common/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///文字超出一定行，自动隐藏，并添加入"...查看更多详情"为它设置点击事件
class TextShowHide extends StatefulWidget {
  const TextShowHide({
    super.key,
    required this.text, //正常字
    this.style, //正常字样式
    this.additionText = '更多', //附加字，如点击查看更多
    this.additionStyle = const TextStyle(color: Color.fromARGB(66, 3, 38, 236)), //附加字的样式
    this.maxLines = 2, //行数，不传 默认为3
    this.additionMore,
  })  : assert(text.length > 2),
        assert(additionText.length > 1);
  final String text;
  final TextStyle? style;
  final String additionText;
  final TextStyle? additionStyle;
  final int maxLines;
  final List<String>? additionMore;
  @override
  _TextShowHideState createState() => _TextShowHideState();
}

class _TextShowHideState extends State<TextShowHide> {
  bool isReadMore = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Wrap(
        runSpacing: 4,
        children: [
          if (!isReadMore || widget.additionMore == null)
            Text(
              widget.text,
              style: widget.style,
              maxLines: widget.maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          if (isReadMore && widget.additionMore != null) ...widget.additionMore!.map((e) => Text(e)).toList(),
          InkWell(
            child: Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              child: Text(
                isReadMore ? "隐藏" : widget.additionText,
                style: widget.additionStyle,
              ),
            ),
            onTap: () {
              setState(() {
                isReadMore = !isReadMore;
              });
            },
          ),
        ],
      ),
    );
  }
}
