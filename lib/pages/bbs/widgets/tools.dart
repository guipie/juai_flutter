import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guxin_ai/common/theme.dart';

class ToolsWidget extends StatefulWidget {
  const ToolsWidget({super.key});
  final int collectNum = 0;
  final int commentNum = 0;
  final int shareNum = 0;
  final int praiseNum = 0;
  @override
  State<ToolsWidget> createState() => _ToolsWidgetState();
}

class _ToolsWidgetState extends State<ToolsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 分享
          iconText(Icons.share_outlined, widget.shareNum),
          const Spacer(),
          iconText(
            Icons.mode_comment_outlined,
            widget.commentNum,
          ),
          const SizedBox(width: 20),
          iconText(
            Icons.favorite_border_outlined,
            widget.praiseNum,
          ),
        ],
      ),
    );
  }

  Row iconText(IconData icondata, int num) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          icondata,
          color: WcaoTheme.secondary,
          size: WcaoTheme.fsXl,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            num.toString(),
            style: TextStyle(color: WcaoTheme.secondary),
          ),
        )
      ],
    );
  }
}
