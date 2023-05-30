import 'package:JuAI/common/apis/user_follow_api.dart';
import 'package:flutter/material.dart';

class FollowButtonWidget extends StatefulWidget {
  const FollowButtonWidget(this.userId, {super.key});
  final int userId;
  @override
  State<FollowButtonWidget> createState() => _FollowButtonWidgetState();
}

class _FollowButtonWidgetState extends State<FollowButtonWidget> {
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
          )
        : OutlinedButton(onPressed: () => _setFollowed(), child: const Text("关注"));
  }

  _setFollowed() {
    UserFollowApi.followed(widget.userId).then(
      (value) => setState(() {
        isFollowed = value;
      }),
    );
  }
}
