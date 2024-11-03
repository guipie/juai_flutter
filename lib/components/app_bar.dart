import 'dart:ui';

import 'package:chat_bot/base.dart';

class JuAppBar {
  //获取半透明的Appbar
  static Widget baseBar({
    double appHeight = 50,
    Widget? title,
    String? text,
    Widget? leading,
    List<Widget>? actions,
    PreferredSize? bottom,
  }) {
    // assert(title != null && text != null, "title and text must be not null!");
    if (actions != null) {
      actions.add(6.width());
    }
    return getFilterWidget(
      child: AppBar(
        centerTitle: true,
        elevation: 0,
        shadowColor: F.T.colorScheme.onSecondary,
        title: text == null
            ? title
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  text,
                ),
              ),
        titleSpacing: 0,
        toolbarHeight: appHeight,
        leading: leading,
        leadingWidth: 80,
        actions: actions,
        bottom: bottom,
        //bottom: getTitle(context, "Chats"),
      ),
    );
  }

/*玻璃容器*/
  static Widget getFilterWidget({
    Widget? child,
    double sigmaX = 12,
    double sigmaY = 12,
    bool hasColor = true, //是否具备颜色
    EdgeInsets? padding,
  }) {
    return ClipRect(
      //背景模糊化
      child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: sigmaX,
            sigmaY: sigmaY,
          ),
          child: Container(
            color: hasColor ? F.T.colorScheme.onPrimary : null,
            padding: padding,
            child: child,
          )),
    );
  }
}
