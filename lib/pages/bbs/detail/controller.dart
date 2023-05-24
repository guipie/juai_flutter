import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guxin_ai/common/apis/content_api.dart';
import 'package:guxin_ai/common/apis/content_comment_api.dart';
import 'package:guxin_ai/common/store/content.dart';
import 'package:guxin_ai/common/store/store.dart';
import 'package:guxin_ai/common/utils/loading.dart';
import 'package:guxin_ai/entities/content/comment.dart';
import 'package:guxin_ai/entities/user_base.dart';
import 'package:guxin_ai/pages/bbs/detail/state.dart';

class ContentDetailController extends GetxController {
  ContentDetailController();
  BbsDetailState state = BbsDetailState();
  @override
  Future<void> onInit() async {
    state.contentId = Get.arguments ?? 0;
    await toDetail(state.contentId);
    getComments(state.contentId);
    super.onInit();
  }

  Future<void> toDetail(int contentId) async {
    var _content = ContentStore.to.contents.firstWhereOrNull((m) => m.id == contentId);
    if (_content == null) {
      state.currentContent = await ContentAPI.contentDetail(contentId);
    } else {
      state.currentContent = _content;
    }
  }

  Future<void> getComments(int contentId) async {
    state.comments.value = await ContentCommentApi.getNewest(contentId);
  }

  void addComment() async {
    var comment = state.commentController.text.trim();
    if (comment.isNotEmpty) {
      ContentCommentApi.add(CommentReq(contentId: state.contentId, comment: comment, replyId: state.replyUserInfo.value.id)).then((value) {
        state.comments.insert(
            0,
            CommentRes(
              comment: comment,
              createId: UserStore.to.userInfo!.id,
              createNick: UserStore.to.userInfo!.nickName,
              avatar: UserStore.to.userInfo!.avatar,
              replyId: state.replyUserInfo.value.id,
              replyUser: state.replyUserInfo.value,
            ));
        removeAll();
        Loading.success("评论成功");
      }).catchError((err) => Loading.error("评论失败$err"));
    }
  }

  toReply(BuildContext context, nick, id) {
    state.replyUserInfo.value = UserInfo(nickName: nick, id: id);
    state.replyUserInfo.refresh();
    FocusScope.of(context).requestFocus(state.commentFocus);
  }

  removeAll() {
    state.replyUserInfo.value = UserInfo(nickName: "", id: 0);
    state.commentController.clear();
  }
}
