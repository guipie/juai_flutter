import 'package:chat_bot/base.dart';
import 'package:chat_bot/components/paging/paging_data.dart';
import 'package:chat_bot/components/paging/paging_notifier_mixin.dart';
import 'package:chat_bot/models/aimodel/aimodel_models.dart';
import 'package:chat_bot/services/http/address/modelai.dart';
import 'package:chat_bot/services/http/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'aimodel_provider.g.dart';

final data = [
  {
    'index': '阿里',
    'children': ['阿坝', '阿拉善', '阿里', '安康', '安庆', '鞍山', '安顺', '安阳', '澳门'],
  },
  {
    'index': 'O',
    'children': [
      '北京',
      '白银',
      '保定',
      '宝鸡',
      '保山',
      '包头',
      '巴中',
      '北海',
      '蚌埠',
      '本溪',
      '毕节',
      '滨州',
      '百色',
      '亳州',
    ],
  },
  {
    'index': 'T',
    'children': [
      '重庆',
      '成都',
      '长沙',
      '长春',
      '沧州',
      '常德',
      '昌都',
      '长治',
      '常州',
      '巢湖',
      '潮州',
      '承德',
      '郴州',
      '赤峰',
      '池州',
      '崇左',
      '楚雄',
      '滁州',
      '朝阳',
    ],
  }
];

@riverpod
class AiModelProvider extends _$AiModelProvider with PagePagingNotifierMixin<AiModel> {
  @override
  Future<PagePagingData<AiModel>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<AiModel>> fetch({required int page}) async {
    var models = await Api.get<List<AiModel>>(ApiModel.models, fromJsonT: (p0) => (p0 as List).map((m) => AiModel.fromJson(m)));
    return PagePagingData(items: models.result ?? [], hasMore: (models.result ?? []).length > 100, page: page);
  }
}
