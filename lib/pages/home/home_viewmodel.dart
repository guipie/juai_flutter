import '../../base.dart';
import '../../models/home/menu_item.dart';

final homeIndexProvider = StateProvider<int>((ref) => 1, name: 'homeIndex');
final menus = [MenuItem(S.current.home_chat, Icons.chat_bubble_outline, Icons.chat_bubble, 0), MenuItem(S.current.home_model, Icons.model_training_outlined, Icons.model_training, 1), MenuItem(S.current.home_square, Icons.square_outlined, Icons.square, 2), MenuItem(S.current.home_factory, Icons.store_outlined, Icons.store, 3), MenuItem(S.current.home_my, Icons.settings_outlined, Icons.settings, 4)];
