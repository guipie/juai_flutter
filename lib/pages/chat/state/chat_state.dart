import '../../../models/chat/response/chat_res_dto.dart';

class ChatState {
  final bool sending;
  final String? sendMsg;
  ChatState({
    this.sending = false,
    this.sendMsg,
  });
  ChatState copyWith({
    bool? sending,
    String? sendMsg,
  }) {
    return ChatState(
      sending: sending ?? this.sending,
      sendMsg: sendMsg ?? this.sendMsg,
    );
  }
}
