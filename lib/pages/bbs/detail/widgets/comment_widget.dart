import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/apis/content_api.dart';
import 'package:JuAI/common/apis/content_comment_api.dart';
import 'package:JuAI/common/store/user.dart';
import 'package:JuAI/common/utils/date.dart';
import 'package:JuAI/common/utils/loading.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/entities/content/comment.dart';
import 'package:JuAI/entities/user_base.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget(this.contentId, {super.key});
  final int contentId;
  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  var commentFocus = FocusNode();
  var commentController = TextEditingController();
  var replyUserInfo = UserInfo(nickName: "", id: 0, userId: 0, userName: '');
  var replyId = 0;
  var comments = <CommentRes>[];
  _removeAll() {
    setState(() {
      replyUserInfo = UserInfo(nickName: "", id: 0, userId: 0, userName: '');
      replyId = 0;
      commentController.clear();
    });
  }

  void _addComment() async {
    var _comment = commentController.text.trim();
    if (_comment.isNotEmpty) {
      ContentCommentApi.add(CommentReq(contentId: widget.contentId, comment: _comment, replyId: replyId)).then((value) {
        comments.insert(
            0,
            CommentRes(
              id: value,
              comment: _comment,
              createId: UserStore.to.userInfo.value!.id,
              createNick: UserStore.to.userInfo.value!.nickName,
              avatar: UserStore.to.userInfo.value!.avatar,
              replyId: replyId,
              replyUser: replyUserInfo,
              likeNum: 0,
            ));
        _removeAll();
        Loading.success("评论成功");
      }).catchError((err) {
        Loading.error("评论失败$err");
      });
    }
  }

  _toReply(BuildContext context, nick, id, reId) {
    replyUserInfo = UserInfo(nickName: nick, id: id, userId: 0, userName: '');
    replyId = reId;
    FocusScope.of(context).requestFocus(commentFocus);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ContentCommentApi.getNewest(widget.contentId).then((value) {
      setState(() {
        comments = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          focusNode: commentFocus,
          controller: commentController,
          decoration: InputDecoration(
            hintText: replyUserInfo.id == 0 ? '优质评论' : '回复' + replyUserInfo.nickName,
            border: const OutlineInputBorder(),
            suffix: replyUserInfo.id > 0 || commentController.text.isNotEmpty
                ? IconButton(
                    onPressed: () => _removeAll(),
                    icon: const Icon(
                      Icons.close_outlined,
                      size: 16,
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => _addComment(),
                child: const Text('添加评论'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ListView.builder(
          shrinkWrap: true,
          itemCount: comments.length,
          itemBuilder: (context, index) {
            var item = comments[index];
            return InkWell(
              onTap: () {},
              hoverColor: Theme.of(context).colorScheme.onSecondary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    children: [
                      avatar(avatarUrl: item.avatar, radius: 18),
                      Text(
                        item.createNick,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(DateTimeStrLine(item.createTime)),
                      if (item.replyId != null && item.replyId! > 0 && item.replyUser != null)
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.blue),
                            children: [
                              const TextSpan(text: "回复:"),
                              TextSpan(text: item.replyUser!.nickName),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.comment),
                        SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            alignment: WrapAlignment.end,
                            children: [
                              TextButton.icon(
                                onPressed: () => _toReply(context, item.createNick, item.createId, item.id),
                                icon: const Text("回复"),
                                label: const Text(""),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    item.isLiked = !(item.isLiked ?? false);
                                  });
                                  ContentCommentApi.clike(item.id).then((value) {
                                    setState(() {
                                      item.isLiked = value;
                                    });
                                  });
                                },
                                icon: Icon(
                                  item.isLiked ?? false ? Icons.favorite : Icons.favorite_border_outlined,
                                  size: 20,
                                ),
                                label: Text(item.likeNum.toString()),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
