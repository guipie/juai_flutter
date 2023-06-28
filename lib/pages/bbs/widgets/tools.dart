import 'dart:math';

import 'package:flutter/material.dart';
import 'package:juai/common/utils/my_share.dart';
import 'package:juai/entities/api_response.dart';
import 'package:juai/common/theme.dart';
import 'package:juai/entities/content/content.dart';
import 'package:juai/pages/bbs/detail/widgets/comment_widget.dart';

class ToolsWidget extends StatefulWidget {
  const ToolsWidget(this.content, {super.key});
  final ContentResEntity content;
  @override
  State<ToolsWidget> createState() => _ToolsWidgetState();
}

class _ToolsWidgetState extends State<ToolsWidget> {
  final ValueNotifier<int> _cnt = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 分享
          InkWell(
            onTap: () {
              MyShare.shareContentDetail(widget.content);
            },
            child: iconText(Icons.share_outlined, Random().nextInt(10)),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                useSafeArea: true,
                useRootNavigator: true,
                builder: (context) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(22),
                    child: CommentWidget(widget.content.id),
                  );
                },
              );
            },
            child: iconText(
              widget.content.isCommented! ? Icons.mode_comment_rounded : Icons.mode_comment_outlined,
              widget.content.commentNum,
              isSelect: widget.content.isCommented!,
            ),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () {
              ContentAPI.contentLike(widget.content.id).then((value) {
                widget.content.isLiked = value;
                _cnt.value++;
              });
              widget.content.isLiked = !widget.content.isLiked!;
              if (widget.content.isLiked!) {
                widget.content.likeNum++;
              } else {
                widget.content.likeNum--;
              }
              _cnt.value++;
            },
            child: ValueListenableBuilder(
              valueListenable: _cnt,
              builder: (context, value, child) => iconText(
                widget.content.isLiked! ? Icons.favorite_sharp : Icons.favorite_border_outlined,
                widget.content.likeNum,
                isSelect: widget.content.isLiked!,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row iconText(IconData icondata, int num, {bool isSelect = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          icondata,
          color: isSelect ? Colors.lightGreen : WcaoTheme.secondary,
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
