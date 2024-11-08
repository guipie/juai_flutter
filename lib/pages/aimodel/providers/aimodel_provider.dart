import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../base.dart';
import '../../../components/paging/paging_data.dart';
import '../../../components/paging/paging_notifier_mixin.dart';
import '../../../models/aimodel/aimodel_models.dart';
import '../../../services/http/address/modelai.dart';
import '../../../services/http/api.dart';

part 'aimodel_provider.g.dart';

@riverpod
class AiModelProvider extends _$AiModelProvider {
  @override
  Future<List<AiModel>> build() => fetch();

  Future<List<AiModel>> fetch() async {
    await Future.delayed(const Duration(seconds: 3));
    var model = AiModel(modelId: 'id', name: '大模型', shortName: '模型', avatarUrl: F.randomAvatar, modelType: 1, category: '腾讯', maxToken: 22);
    var models = List.generate(10, (index) => model); // await Api.get<List<AiModel>, AiModel>(ApiModel.models, fromJsonT: AiModel.fromJson);
    return models;
  }
  // var result = <String, List<AiModel>>{};
  // for (var element in models.result ?? []) {
  //   if (result.keys.contains(element.category)) {
  //     result[element.category]!.add(element);
  //   } else {
  //     result[element.category] = [element];
  //   }
  // }
  // return result;
}
