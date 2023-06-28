import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({
    Key? key,
    required this.items,
    this.itemBgColor,
    this.itemHeight,
    this.textStyle,
  }) : super(key: key);
  final List<SheetItem> items;
  final Color? itemBgColor;
  final double? itemHeight;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: items
              .map((e) => _itemBgView(context, label: e.label, textStyle: e.textStyle, icon: e.icon, bgColor: e.bgColor, borderRadius: e.borderRadius, height: e.height, alignment: e.alignment, onTap: () {
                    Get.back();
                    e.onTap?.call();
                  }))
              .toList(),
        ),
        Container(
          color: const Color(0xFFE6E6E6),
          height: 7.h,
        ),
        _itemBgView(context, label: "取消", onTap: () => Get.back(), line: false),
        Container(
          color: Theme.of(context).cardColor,
          height: MediaQuery.of(context).padding.bottom,
        )
      ],
    );
  }

  Widget _itemBgView(
    BuildContext context, {
    required String label,
    String? icon,
    Function()? onTap,
    BorderRadius? borderRadius,
    Color? bgColor,
    TextStyle? textStyle,
    double? height,
    MainAxisAlignment? alignment,
    bool line = true,
  }) =>
      Ink(
        decoration: BoxDecoration(
          color: bgColor ?? itemBgColor ?? Theme.of(context).primaryColor,
          borderRadius: borderRadius,
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: line
                ? BoxDecoration(
                    border: BorderDirectional(
                      bottom: BorderSide(color: Color(0xFFCBCBCB), width: 0.5),
                    ),
                  )
                : null,
            height: height ?? itemHeight ?? 58.h,
            // width: 375.w,
            // alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: alignment ?? MainAxisAlignment.center,
              children: [
                if (null != icon)
                  Padding(
                    padding: EdgeInsets.only(
                      right: 21.w,
                      left: alignment == MainAxisAlignment.start ? 45.w : 0,
                    ),
                    child: _image(icon),
                  ),
                _text(label, textStyle, context),
              ],
            ),
          ),
        ),
      );

  _text(label, style, BuildContext context) => Text(
        label,
        style: style ?? textStyle ?? Theme.of(context).colorScheme.secondary,
      );

  _image(icon) => Image.asset(
        icon,
        width: 18.w,
        height: 18.w,
      );
}

class SheetItem {
  final String label;
  final TextStyle? textStyle;
  final String? icon;
  final Function()? onTap;
  final BorderRadius? borderRadius;
  final Color? bgColor;
  final double? height;
  final MainAxisAlignment? alignment;

  SheetItem({
    required this.label,
    this.textStyle,
    this.icon,
    this.onTap,
    this.borderRadius,
    this.bgColor,
    this.height,
    this.alignment,
  });
}
