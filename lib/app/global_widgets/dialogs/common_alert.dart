import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../common/gaps.dart';

/// 自定义 Dialog
///
class AlertContentView extends Dialog {
  //标题
  final String title;

  //提示文案内容
  final String content;
  final Widget? contentWidget;
  final TextStyle? contentStyle, leftStyle, rightStyle;

  ///内容前缀
  final Widget? prefixContent;

  ///子标题
  final String? subContent;

  //确认取消按钮
  final String rightTxt, leftTxt;

  //按钮回调
  final VoidCallback? onRight;
  final Future Function()? onLeft;

  final bool canDissmiss;
  final bool tapLeftBack;

  const AlertContentView({
    super.key,
    this.title = '',
    this.content = '',
    this.rightTxt = '确认',
    this.leftTxt = '取消',
    this.onRight,
    this.tapLeftBack = true,
    this.onLeft,
    this.prefixContent,
    this.subContent,
    this.contentStyle,
    this.leftStyle,
    this.rightStyle,
    this.canDissmiss = true,
    this.contentWidget,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canDissmiss,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            constraints: BoxConstraints(
              maxWidth: 260.w,
            ),
            // margin: EdgeInsets.symmetric(horizontal: 58),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _titleWidget(),
                _bottomWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 20),
      child: Column(
        children: [
          if (title.isNotEmpty) Text(title).paddingOnly(bottom: 8),
          if (content.isNotEmpty)
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Visibility(
                      visible: prefixContent != null,
                      child: prefixContent ?? const SizedBox(),
                    ),
                  ),
                  TextSpan(text: content, style: contentStyle),
                ],
              ),
            ).paddingOnly(top: 4),
          if (contentWidget != null) contentWidget!,
          Visibility(
            visible: subContent != null,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(subContent ?? ""),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomWidget() {
    return Column(
      children: [
        Gaps.line,
        Row(
          children: [
            if (leftTxt.isNotEmpty)
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    await onLeft?.call();
                    Get.back();
                  },
                  child: Container(
                    height: 42,
                    alignment: Alignment.center,
                    child: Text(leftTxt, style: leftStyle),
                  ),
                ),
              ),
            if (leftTxt.isNotEmpty) Gaps.vLine(height: 20, width: 1),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.back();
                  onRight?.call();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 42,
                  child: Text(rightTxt, style: rightStyle),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// 自定义 Dialog
///
class AlertActionsSaveView extends Dialog {
  //确认取消按钮
  final String saveTxt, cancelTxt;

  final TextStyle? leftStyle, rightStyle;

  //按钮回调
  final VoidCallback? onSave;
  final Future Function()? onCancel;

  final bool canDissmiss;
  final bool tapLeftBack;

  const AlertActionsSaveView({
    super.key,
    this.saveTxt = '保存',
    this.cancelTxt = '取消',
    this.onSave,
    this.tapLeftBack = true,
    this.onCancel,
    this.canDissmiss = true,
    this.leftStyle,
    this.rightStyle,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canDissmiss,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: BoxConstraints(
                maxWidth: 260.w,
              ),
              // margin: EdgeInsets.symmetric(horizontal: 58),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Get.back();
                        onSave?.call();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(saveTxt, style: rightStyle),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        await onCancel?.call();
                        Get.back();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(cancelTxt, style: leftStyle),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
