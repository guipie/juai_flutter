import 'package:JuAI/common/apis/user_follow_api.dart';
import 'package:JuAI/common/theme.dart';
import 'package:flutter/material.dart';

class FollowFillButtonWidget extends StatefulWidget {
  const FollowFillButtonWidget(this.userId, {super.key});
  final int userId;
  @override
  State<FollowFillButtonWidget> createState() => _FollowFillButtonWidgetState();
}

class _FollowFillButtonWidgetState extends State<FollowFillButtonWidget> {
  bool isFollowed = false;
  @override
  void initState() {
    UserFollowApi.isFollowed(widget.userId).then(
      (value) => setState(() {
        isFollowed = value;
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isFollowed
        ? FilledButton(
            onPressed: () => _setFollowed(),
            child: const Text("已关注"),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 12)),
            ),
          )
        : OutlinedButton(
            onPressed: () => _setFollowed(),
            child: const Text("关注"),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 12)),
            ),
          );
  }

  _setFollowed() {
    setState(() {
      isFollowed = !isFollowed;
    });
    UserFollowApi.followed(widget.userId).then(
      (value) => setState(() {
        isFollowed = value;
      }),
    );
  }
}
