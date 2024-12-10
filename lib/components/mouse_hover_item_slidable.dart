import 'package:flutter_slidable/flutter_slidable.dart';
import '../base.dart';
import 'mouse_hover.dart';
import 'mouse_hover_item.dart';
import 'td/src/components/avatar/td_avatar.dart';

@immutable
class MouseHoverSlidableItem extends ConsumerWidget {
  final List<SlidableAction> actions;
  final String? leadingPicUrl;
  final Widget? leadingWidget;
  final String title;
  final String? titleExtend;
  final String? subTitle;
  final bool isShowDefaultTrailing;
  final String? trailing;
  final Widget? trailingWidget;
  final bool? isSelected;
  final Widget? footerWidget;
  final Widget? headWidget;
  final bool? isRadius;
  final Function()? onTap;
  const MouseHoverSlidableItem({
    super.key,
    this.titleExtend,
    this.leadingPicUrl,
    this.leadingWidget,
    required this.title,
    required this.subTitle,
    required this.actions,
    this.isShowDefaultTrailing = true,
    this.trailing,
    this.trailingWidget,
    this.isSelected,
    this.footerWidget,
    this.headWidget,
    this.isRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.4,
        children: actions,
      ),
      child: MouseHoverItem(
        leadingPicUrl: leadingPicUrl,
        leadingWidget: leadingWidget,
        title: title,
        titleExtend: titleExtend,
        subTitle: subTitle,
        isShowDefaultTrailing: isShowDefaultTrailing,
        trailing: trailing,
        trailingWidget: trailingWidget,
        isSelected: isSelected,
        footerWidget: footerWidget,
        headWidget: headWidget,
        isRadius: isRadius ?? false,
        onTap: onTap,
      ),
    );
  }
}
