import 'package:chat_bot/base.dart';

part 'conversation_provider.g.dart';

@riverpod
class ConversationProvider extends _$ConversationProvider {
  @override
  build() {
    var item = ConversationModel(name: '测试', avatar: F.randomAvatar);
    return [item, item, item, item, item, item];
  }
}
