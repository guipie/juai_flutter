import '../base/base.dart';
import '../models/aimodel/aimodel_model.dart';
import 'enums/aimodel_enum.dart';

class Constant {
  static String version = 'default1.0';
  static const String pubKey = '04F6E0C3345AE42B51E06BF50B98834988D54EBC7460FE135A48171BC0629EAE205EEDE253A530608178A98F1E19BB737302813BA39ED3FA3C51639D7A20C7391A';
  static AiModel defaultModel = SpUtil.haveKey(SpKeys.defaultModel) ? SpUtil.getObj<AiModel>(SpKeys.defaultModel, AiModel.fromJson)! : const AiModel(id: 1111, modelId: 'gpt-4o-mini', name: '默认模型', avatarUrl: 'https://oss.juai.link/juai/juai/prompt/gpt4-preview.png', modelType: AimodelEnum.chat, service: 'openai');
}
