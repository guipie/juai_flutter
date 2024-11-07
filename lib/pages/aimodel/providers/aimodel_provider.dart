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
    var models = await Api.get<List<AiModel>, AiModel>(ApiModel.models, fromJsonT: AiModel.fromJson);
    return models.result ?? [];
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
