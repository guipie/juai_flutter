import 'package:flutter/material.dart';

import '../../../tdesign_flutter.dart';
import 'td_wrap_sidebar_item.dart';

enum TDSideBarStyle {
  normal,
  outline,
}

class SideItemProps {
  int index;
  int value;
  bool? disabled;
  IconData? icon;
  IconData? checkedIcon;
  String? label;
  String? tips;
  TDBadge? badge;
  TextStyle? textStyle;

  SideItemProps({required this.value, required this.index, this.disabled, this.icon, this.checkedIcon, this.label, this.badge, this.textStyle, this.tips});
}

class TDSideBar extends StatefulWidget {
  const TDSideBar({
    Key? key,
    this.value,
    this.defaultValue,
    this.selectedColor,
    this.children = const [],
    this.onChanged,
    this.onSelected,
    this.height,
    this.controller,
    this.contentPadding,
    this.selectedTextStyle,
    this.style = TDSideBarStyle.normal,
  }) : super(key: key);

  /// 选项值
  final int? value;

  /// 默认值
  final int? defaultValue;

  /// 单项
  final List<TDSideBarItem> children;

  /// 选中值发生变化（Controller控制）
  final ValueChanged<int>? onChanged;

  /// 选中值发生变化（点击事件）
  final ValueChanged<int>? onSelected;

  /// 选中值后颜色
  final Color? selectedColor;

  /// 选中样式
  final TextStyle? selectedTextStyle;

  /// 样式
  final TDSideBarStyle style;

  /// 高度
  final double? height;

  /// 自定义文本框内边距
  final EdgeInsetsGeometry? contentPadding;

  /// 控制器
  final TDSideBarController? controller;

  @override
  State<TDSideBar> createState() => _TDSideBarState();
}

class _TDSideBarState extends State<TDSideBar> {
  late List<SideItemProps> displayChildren;
  final _scrollerController = ScrollController();
  final GlobalKey globalKey = GlobalKey();
  final double itemHeight = 56.0;

  // 查找某值对应项
  SideItemProps findSideItem(int value) {
    return displayChildren.where((element) => element.value == value).first;
  }

  // 选中某值
  void selectValue(int value, {bool needScroll = false}) {
    SideItemProps? item;
    for (var element in displayChildren) {
      if (element.value == value) {
        item = element;
      }
    }

    if (needScroll && item != null) {
      try {
        var height = globalKey.currentContext!.size!.height;
        var offset = _scrollerController.offset;
        var distance = item.index * itemHeight - offset;
        if (distance + itemHeight > height) {
          _scrollerController.animateTo(offset + itemHeight, duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
        } else if (distance < 0) {
          _scrollerController.animateTo(offset - itemHeight, duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    // controller注册事件
    if (widget.controller != null) {
      widget.controller!.addListener(() {
        selectValue(widget.controller!.currentValue, needScroll: true);
      });
    }

    displayChildren = widget.children.asMap().entries.map((entry) => SideItemProps(index: entry.key, disabled: entry.value.disabled, value: entry.value.value, icon: entry.value.icon, checkedIcon: entry.value.checkedIcon, label: entry.value.label, textStyle: entry.value.textStyle, badge: entry.value.badge, tips: entry.value.tips)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      key: globalKey,
      constraints: const BoxConstraints(
        minWidth: 60,
      ),
      child: SizedBox(
        height: widget.height,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: ListView.builder(
            itemCount: displayChildren.length,
            controller: _scrollerController,
            itemBuilder: (BuildContext context, int index) {
              var ele = displayChildren[index];
              return Tooltip(
                message: ele.tips,
                verticalOffset: 15,
                showDuration: const Duration(seconds: 2),
                child: TDWrapSideBarItem(
                  style: widget.style,
                  value: ele.value,
                  icon: widget.value == ele.index ? ele.checkedIcon : ele.icon,
                  disabled: ele.disabled ?? false,
                  label: ele.label ?? '',
                  badge: ele.badge,
                  textStyle: ele.textStyle,
                  selected: widget.value == ele.index,
                  selectedColor: widget.selectedColor,
                  selectedTextStyle: widget.selectedTextStyle,
                  contentPadding: widget.contentPadding,
                  topAdjacent: widget.value != null && widget.value! + 1 == ele.index,
                  bottomAdjacent: widget.value != null && widget.value! - 1 == ele.index,
                  onTap: () {
                    if (!(ele.disabled ?? false)) {
                      widget.onSelected?.call(ele.value);
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
