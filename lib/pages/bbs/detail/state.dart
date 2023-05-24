import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guxin_ai/entities/content/comment.dart';
import 'package:guxin_ai/entities/content/content.dart';
import 'package:guxin_ai/entities/user_base.dart';

class BbsDetailState {
  late ContentResEntity currentContent;
  int contentId = 0;
  final commentController = TextEditingController();
  final commentFocus = FocusNode();
  final comments = <CommentRes>[].obs;
  var replyUserInfo = UserInfo(nickName: "", id: 0).obs;
}
