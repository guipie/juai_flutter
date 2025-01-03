import '../../base.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../utils/extension/extension_json_converter.dart';
import '../prompt/prompt_res_model.dart';

part 'conversation_item_model.freezed.dart';
part 'conversation_item_model.g.dart';

@freezed
class ConversationItemModel with _$ConversationItemModel {
  const factory ConversationItemModel({
    int? id,
    required String title,
    String? desc,
    String? avatar,
    @DateTimeConverter() DateTime? createTime,
    @DateTimeConverter() DateTime? lastTime,
    String? draft,
    @BoolConverter() bool? isTop,
    @Default(0) int unReadCnt,
    required ConversationEnum type,
    @Default(0) int relationId,
    @Default(Constant.defaultModel) String model,
    String? extens,
  }) = _ConversationItemModel;
  factory ConversationItemModel.fromJson(Map<String, dynamic> json) => _$ConversationItemModelFromJson(json);
}
