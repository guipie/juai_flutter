import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart';

import '../base/base.dart';
import '../pages/home/view_model/home_view_model.dart';

class JuAppBar {
  //获取半透明的Appbar
  static PreferredSizeWidget? baseBar({
    double appHeight = 50,
    Widget? title,
    String? text,
    Widget? leading,
    double? leadingWidth,
    Size? size,
    List<Widget>? actions,
    PreferredSize? bottom,
  }) {
    assert(title != null || text != null, 'title and text must be not null!');
    if (actions != null) {
      actions.add(6.width());
    }
    return PreferredSize(
      preferredSize: size ?? Size.fromHeight(appHeight),
      child: getFilterWidget(
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          title: text == null ? title : Text(text),
          titleSpacing: 0,
          leading: leading,
          leadingWidth: leadingWidth ?? 40,
          actions: actions,
          bottom: bottom,
          //bottom: getTitle(context, "Chats"),
        ),
      ),
    );
  }

/*玻璃容器*/
  static Widget getFilterWidget({
    Widget? child,
    double sigmaX = 12,
    double sigmaY = 12,
    EdgeInsets? padding,
  }) {
    return ClipRect(
      //背景模糊化
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX,
          sigmaY: sigmaY,
        ),
        child: child,
      ),
    );
  }
}
