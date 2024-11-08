import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import '../base.dart';
import 'mouse_hover.dart';
import 'td/src/components/avatar/td_avatar.dart';

@immutable
class MouseHoverSlidableItem extends ConsumerWidget {
  final String picUrl;
  final String title;
  final String? titleExtend;
  final String subTitle;
  final List<SlidableAction> actions;
  void Function()? onPressed;
  final bool isShowDefaultTrailing;
  final String? trailing;
  final Widget? trailingWidget;
  MouseHoverSlidableItem({
    super.key,
    this.titleExtend,
    required this.picUrl,
    required this.title,
    required this.subTitle,
    required this.actions,
    this.onPressed,
    this.isShowDefaultTrailing = true,
    this.trailing,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget trailingItem = const SizedBox.shrink();
    if (trailingWidget != null)
      trailingItem = trailingWidget!;
    else if (trailing.isNotEmpty())
      trailingItem = Text(
        trailing!,
        style: TextStyle(
          color: ref.watch(themeProvider).timeColor(),
          fontSize: 12,
        ),
      );
    else if (isShowDefaultTrailing)
      trailingItem = Icon(
        CupertinoIcons.right_chevron,
        color: Theme.of(context).textTheme.titleSmall?.color,
        size: 18,
      );
    return MouseHoverWidget(
      hoverColor: ref.watch(themeProvider).pinedBgColor(),
      color: ref.watch(themeProvider).divideBgColor(),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: 0.4,
          children: actions,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: ListTile(
            leading: picUrl.endsWith('.svg')
                ? SvgPicture.asset(
                    picUrl,
                    width: 46,
                  )
                : TDAvatar(
                    size: TDAvatarSize.medium,
                    type: TDAvatarType.normal,
                    shape: TDAvatarShape.square,
                    avatarUrl: picUrl.startsWith('http') ? picUrl : null,
                    defaultUrl: (!picUrl.startsWith('http')) ? picUrl : '',
                  ),
            title: Row(
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                if (titleExtend.isNotEmpty())
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                    ),
                    child: Text(
                      titleExtend!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).primaryColor, fontSize: 8),
                    ),
                  ),
              ],
            ),
            subtitle: Text(
              subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 13),
            ),
            trailing: trailingItem,
          ),
        ),
      ).click(
        () => onPressed?.call(),
      ),
    );
  }
}
