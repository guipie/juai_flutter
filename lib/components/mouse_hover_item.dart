import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../base.dart';
import 'mouse_hover.dart';
import 'td/src/components/avatar/td_avatar.dart';

@immutable
class MouseHoverItem extends ConsumerWidget {
  final String? leadingPicUrl;
  final Widget? leadingWidget;
  final String title;
  final String? titleExtend;
  final String? subTitle;
  void Function()? onPressed;
  final bool isShowDefaultTrailing;
  final String? trailing;
  final Widget? trailingWidget;
  MouseHoverItem({
    super.key,
    required this.title,
    this.titleExtend,
    this.leadingWidget,
    this.leadingPicUrl,
    this.subTitle,
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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: ListTile(
          leading: leadingPicUrl.isNotEmpty()
              ? TDAvatar(
                  size: TDAvatarSize.medium,
                  type: TDAvatarType.normal,
                  shape: TDAvatarShape.square,
                  avatarUrl: leadingPicUrl!.startsWith('http') ? leadingPicUrl : null,
                  defaultUrl: (!leadingPicUrl!.startsWith('http')) ? leadingPicUrl! : '',
                )
              : leadingWidget,
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
          subtitle: subTitle.isEmpty()
              ? null
              : Text(
                  subTitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 13),
                ),
          trailing: trailingItem,
        ),
      ).click(
        () => onPressed?.call(),
      ),
    );
  }
}
