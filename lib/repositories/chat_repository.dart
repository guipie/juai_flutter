import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../base/base.dart';
import '../models/chat/chat_item_model.dart';
import '../models/chat/request/chat_req_dto.dart';
import '../services/http/apis/chat.dart';
import '../base/base_repository.dart';
part 'chat_repository.g.dart';

@Riverpod(keepAlive: true)
ChatRepository chatRepository(Ref ref) {
  return ChatRepository();
}

class ChatRepository extends BaseRepository<Object> {
  Future<void> chat(
    ChatReqDto req, {
    required Function(String) receive,
    Function? error,
    Function(dynamic)? complete,
    CancelToken? cancelToken,
  }) async {
    var response = await Api.response<ResponseBody>(
      ApiChat.openaiChat,
      options: Options(
        responseType: ResponseType.stream,
        headers: {'Accept': 'text/event-stream'},
        method: 'POST',
        sendTimeout: const Duration(minutes: 5),
        receiveTimeout: const Duration(minutes: 5),
      ),
      cancelToken: cancelToken,
      data: req.toJson(),
    );
    // 监听数据流
    Stream<List<int>> stream = response.data!.stream;
    StreamSubscription? subscription;
    subscription = stream.listen(
      (line) {
        var data = utf8.decode(line, allowMalformed: true).trimRight();
        receive(data);
      },
      onDone: () async {
        complete?.call('complete');
        await subscription?.cancel();
      },
      onError: (err) {
        error?.call(err);
        subscription?.cancel();
      },
      cancelOnError: true,
    );
  }
}
