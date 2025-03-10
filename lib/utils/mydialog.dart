import 'package:flutter/material.dart';

import '../base/base.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;

import '../models/common/dic.dart';

class Mydialog {
  final BuildContext context;

  /// 标题
  final String title;

  /// 内容
  final String content;

  /// 按钮名称
  final String btnName;

  /// 按钮字体颜色
  final Color btnColor;

  /// 左侧按钮名称
  final String leftBtnName;

  /// 左侧按钮字体颜色
  final Color leftBtnColor;

  /// 右侧按钮名称
  final String rightBtnName;

  /// 右侧按钮字体颜色
  final Color rightBtnColor;

  /// 点击背景是否可以关闭弹窗
  final bool barrierDismissible;

  /// 点击返回按钮是否可以关闭弹窗
  final bool backDismissible;

  /// 背景颜色
  final Color? barrierColor;

  /// 阴影
  final double elevation;

  /// 内边距
  final EdgeInsets? padding;

  /// 按钮点击回调
  Function()? onBtnPressed;

  /// 左侧按钮点击回调
  Function()? onLeftBtnPressed;

  /// 右侧按钮点击回调
  Function()? onRightBtnPressed;

  /// 弹窗列表
  final List<Dic> itemStringList;

  /// 选中的索引，默认选中第一个
  int selectIndex = 0;

  /// 选择item后回调
  final ValueChanged<int>? onSelected;

  Mydialog({
    required this.context,
    this.title = '提示',
    this.content = '这是底部单按钮普通提示弹出框，请知晓',
    this.btnName = '知道了',
    this.btnColor = const Color(0xFFFF8900),
    this.leftBtnName = '取消',
    this.leftBtnColor = const Color(0xFF666666),
    this.rightBtnName = '确认',
    this.rightBtnColor = const Color(0xFFFE3826),
    this.onBtnPressed,
    this.onLeftBtnPressed,
    this.onRightBtnPressed,
    this.barrierColor,
    this.barrierDismissible = true,
    this.backDismissible = true,
    this.elevation = 0,
    this.padding,
    this.itemStringList = const [],
    this.selectIndex = 0,
    this.onSelected,
  });

  void showNoticeDialogWithOneButton() {
    _showGeneralDialog(
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(backDismissible);
            },
            child: AnimatedPadding(
              padding: padding ?? EdgeInsets.symmetric(horizontal: 0.2.sw, vertical: 24),
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: MediaQuery.removeViewInsets(
                removeLeft: true,
                removeTop: true,
                removeRight: true,
                removeBottom: true,
                context: context,
                child: Center(
                  child: Material(
                    elevation: elevation,
                    borderRadius: BorderRadius.circular(14),
                    child: _noticeViewWithOneButton(),
                  ),
                ),
              ),
            ),
          );
        },
        child: null);
  }

  void showNoticeDialogWithTwoButtons() {
    _showGeneralDialog(builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () {
          return Future.value(backDismissible);
        },
        child: AnimatedPadding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 0.2.sw, vertical: 24),
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: MediaQuery.removeViewInsets(
            removeLeft: true,
            removeTop: true,
            removeRight: true,
            removeBottom: true,
            context: context,
            child: Center(
              child: Material(
                elevation: elevation,
                borderRadius: BorderRadius.circular(14),
                child: _noticeViewWithTwoButtons(),
              ),
            ),
          ),
        ),
      );
    });
  }

  /// 重写showGeneralDialog,系统自带的背景背景透明不能修改
  void _showGeneralDialog({
    Widget Function(BuildContext)? builder,
    Widget? child,
  }) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        final pageChild = child ?? Builder(builder: builder!);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: barrierColor ?? Colors.black54,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
    );
  }

  Widget _noticeViewWithOneButton() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 130,
      ),
      width: double.infinity - 104,
      child: Column(
        mainAxisSize: MainAxisSize.min, //column自适应子控件的高度，不加这条默认会撑到最大
        children: <Widget>[
          _contentViewInOneButton(),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFEEEEEE),
          ),
          _bottomViewInOneButton(),
        ],
      ),
    );
  }

  Widget _noticeViewWithTwoButtons() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 140,
      ),
      width: double.infinity - 104,
      child: Column(
        mainAxisSize: MainAxisSize.min, //column自适应子控件的高度，不加这条默认会撑到最大
        children: <Widget>[
          _titleViewInTwoButtons(),
          _contentViewInTwoButtons(),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFEEEEEE),
          ),
          _bottomViewInTwoButtons(),
        ],
      ),
    );
  }

  Widget _titleViewInTwoButtons() {
    return Container(
      margin: const EdgeInsets.only(top: 19, left: 16, right: 16),
      height: 22,
      child: Text(title,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 17,
            fontWeight: FontWeight.w400,
          )),
    );
  }

  Widget _contentViewInTwoButtons() {
    return Container(
      constraints: const BoxConstraints(minHeight: 32),
      margin: const EdgeInsets.only(top: 9, bottom: 14, left: 16, right: 16),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Color(0xFF666666), fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _bottomViewInTwoButtons() {
    return SizedBox(
      height: 43,
      child: Row(
        children: <Widget>[
          _clickView(leftBtnName, leftBtnColor, onLeftBtnPressed),
          const VerticalDivider(
            color: Color(0xFFEEEEEE),
            width: 1,
            thickness: 1,
          ),
          _clickView(rightBtnName, rightBtnColor, onRightBtnPressed),
        ],
      ),
    );
  }

  Widget _contentViewInOneButton() {
    return Container(
      constraints: const BoxConstraints(minHeight: 44),
      margin: const EdgeInsets.only(top: 22, bottom: 20, left: 16, right: 16),
      alignment: Alignment.center,
      child: Text(content, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF333333), fontSize: 17, fontWeight: FontWeight.w400)),
    );
  }

  Widget _bottomViewInOneButton() {
    return SizedBox(
      height: 43,
      child: Row(
        children: <Widget>[
          _clickView(btnName, btnColor, onBtnPressed),
        ],
      ),
    );
  }

  Widget _clickView(String btnName, Color textColor, Function()? btnClick) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: btnClick,
        child: Container(
          height: 43,
          alignment: Alignment.center,
          child: Text(btnName, style: TextStyle(color: textColor, fontSize: 17, fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }

  void showSheetView() {
    showModalBottomSheet(
        context: context,
        // isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return ListView(
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: 12.paddingHorizontal(vertical: 4),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      20.height(),
                      Column(
                        children: _chooseListAllWidget(setState),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        S.current.cancel,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: fl.FluentTheme.of(context).accentColor.lightest,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      onPressed: () {
                        if (onSelected != null) onSelected!(selectIndex);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              );
            },
          );
        });
  }

  List<Widget> _chooseListAllWidget(StateSetter setState) {
    var widgetList = <Widget>[];
    for (var i = 0; i < itemStringList.length; i++) {
      widgetList.add(_chooseListItemWidget(i, setState));
    }
    return widgetList;
  }

  Widget _chooseListItemWidget(int index, StateSetter setMyState) {
    return ListTile(
      title: Text(
        itemStringList[index].label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Radio(
        value: itemStringList[index].val,
        groupValue: itemStringList[selectIndex].val,
        onChanged: (value) {},
      ),
      shape: const Border(bottom: BorderSide(width: 0.1)),
      onTap: () {
        setMyState(() {
          selectIndex = index;
          if (onSelected != null) onSelected!(selectIndex);
        });
        Navigator.pop(context);
      },
    ).juCursor;
  }
}
