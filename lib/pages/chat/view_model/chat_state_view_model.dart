import '../../../base/base.dart';
import '../../../models/chat/response/chat_res_dto.dart';
import '../state/chat_state.dart';
part 'chat_state_view_model.g.dart';

@riverpod
class ChatStateVM extends _$ChatStateVM {
  @override
  ChatState build() {
    return ChatState();
  }

  void setSending(bool sending) {
    state = state.copyWith(sending: sending);
  }

  void setSendMsg(String sendMsg) {
    state = state.copyWith(sendMsg: sendMsg);
  }
}
