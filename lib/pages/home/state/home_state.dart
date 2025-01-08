import '../../../base/base.dart';
import '../../aimodel/view/aimodel_pc_page.dart';
import '../../aimodel/view/prompt_page.dart';
import '../../chat/view/conversation_pc_page.dart';
import '../../setting/setting_page.dart';
import '../../square/square.dart';
import '../model/menu_item.dart';

class HomeState {
  int curTabIndex;
  String homePcTitle;
  List<MenuItem> menus;
  HomeState({
    this.curTabIndex = 0,
    this.homePcTitle = '',
    required this.menus,
  });
  HomeState.init()
      : this(
          menus: [
            MenuItem(S.current.home_chat, Icons.chat_bubble_outline, Icons.chat_bubble, 0, const ConversationPcPage()),
            MenuItem(S.current.home_model, Icons.model_training_outlined, Icons.model_training, 1, const AiModelPcPage()),
            MenuItem(S.current.home_square, Icons.square_outlined, Icons.square, 2, const SquarePage()),
            MenuItem(S.current.home_factory, Icons.store_outlined, Icons.store, 3, const PromptPage()),
            MenuItem(S.current.home_my, Icons.settings_outlined, Icons.settings, 4, const SettingPage()),
          ],
        );
  HomeState copyWith({
    int? curTabIndex,
    String? homePcTitle,
    List<MenuItem>? menus,
  }) {
    return HomeState(
      curTabIndex: curTabIndex ?? this.curTabIndex,
      homePcTitle: homePcTitle ?? this.homePcTitle,
      menus: menus ?? this.menus,
    );
  }
}
