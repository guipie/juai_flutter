import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../base/base.dart';
import 'image/image.dart';
import 'mouse_hover.dart';

@immutable
class MouseHoverItem extends ConsumerWidget {
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
  final bool isRadius;
  final Function()? onTap;
  const MouseHoverItem({
    super.key,
    required this.title,
    this.titleExtend,
    this.leadingWidget,
    this.leadingPicUrl,
    this.subTitle,
    this.isShowDefaultTrailing = true,
    this.trailing,
    this.isSelected,
    this.trailingWidget,
    this.footerWidget,
    this.headWidget,
    this.onTap,
    this.isRadius = true,
  })  : assert(!(leadingPicUrl != null && leadingWidget != null)),
        assert(!(trailingWidget != null && trailing != null));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget trailingItem = const SizedBox.shrink();
    if (trailingWidget != null)
      trailingItem = trailingWidget!;
    else if (trailing.isNotEmptyJu())
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
      hoverColor: ref.watch(themeProvider).pinedBgColor().withOpacity(0.5),
      color: isSelected == true ? ref.watch(themeProvider).pinedBgColor() : fl.FluentTheme.of(context).cardColor,
      onTap: onTap,
      isRadius: isRadius,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headWidget ?? const SizedBox.shrink(),
            ListTile(
              mouseCursor: SystemMouseCursors.click,
              leading: leadingWidget ?? JuImage(leadingPicUrl, width: 42, height: 42),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  if (titleExtend.isNotEmptyJu())
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
              trailing: trailingItem,
              subtitle: subTitle.isEmptyJu()
                  ? null
                  : Text(
                      subTitle!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 13),
                    ),
            ),
            SizedBox(
              width: double.infinity,
              child: footerWidget ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
