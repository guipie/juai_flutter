import '../../base.dart';
import 'aimodel_res_model.dart';
import '../prompt/prompt_res_model.dart';

class AiModelModel {
  int selectedPrompt;
  AiModelRes? selectedAiModel;
  PromptRes? curPrompt;
  PageController pageController;
  AiModelModel({this.selectedPrompt = 1, this.selectedAiModel, this.curPrompt}) : pageController = PageController();
}
