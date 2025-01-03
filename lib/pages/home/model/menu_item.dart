import '../../../base.dart';

class MenuItem {
  final String? label;
  final IconData icon;
  final IconData checkedIcon;
  final int index;
  final Widget page;
  MenuItem(
    this.label,
    this.icon,
    this.checkedIcon,
    this.index,
    this.page,
  );
}
