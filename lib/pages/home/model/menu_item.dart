import 'package:chat_bot/base.dart';

class MenuItem {
  final String? label;
  final IconData icon;
  final IconData checkedIcon;
  final int index;
  MenuItem(
    this.label,
    this.icon,
    this.checkedIcon,
    this.index,
  );
}
