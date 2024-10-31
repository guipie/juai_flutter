import 'dart:math';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import '../../../tdesign_flutter.dart';
import '../../util/context_extension.dart';

/// TDesign刷新头部
/// 结合EasyRefresh类实现下拉刷新,继承自Header类，字段含义与父类一致
class TDRefreshHeader extends Header {
  TDRefreshHeader({
    this.key,
    double extent = 48.0,
    double triggerDistance = 48.0,
    bool float = false,
    Duration? completeDuration,
    bool enableHapticFeedback = true,
    bool enableInfiniteRefresh = false,
    bool overScroll = true,
    this.loadingIcon = TDLoadingIcon.circle,
    this.backgroundColor,
    required super.triggerOffset,
    required super.clamping,
  });

  /// Key
  final Key? key;

  /// loading样式
  final TDLoadingIcon loadingIcon;

  /// 背景颜色
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, IndicatorState state) {
    // 不能为水平方向
    assert(
        state.axisDirection == AxisDirection.down ||
            state.axisDirection == AxisDirection.up,
        'Widget cannot be horizontal');
    return TGIconHeaderWidget(
        key: key,
        loadingIcon: loadingIcon,
        backgroundColor: backgroundColor,
        refreshState: state.mode,
        refreshIndicatorExtent: state.indicator.infiniteOffset ?? 10);
  }
}

/// 刷新头部组件
class TGIconHeaderWidget extends StatefulWidget {
  /// loading样式
  final TDLoadingIcon loadingIcon;

  /// 背景颜色
  final Color? backgroundColor;

  /// 刷新状态
  final IndicatorMode refreshState;

  /// 下拉高度
  final double refreshIndicatorExtent;

  const TGIconHeaderWidget({
    Key? key,
    this.backgroundColor,
    required this.refreshState,
    required this.refreshIndicatorExtent,
    required this.loadingIcon,
  }) : super(key: key);

  @override
  TGIconHeaderWidgetState createState() {
    return TGIconHeaderWidgetState();
  }
}

class TGIconHeaderWidgetState extends State<TGIconHeaderWidget>
    with TickerProviderStateMixin {
  IndicatorMode get _refreshState => widget.refreshState;

  Widget _buildLoading() => TDLoading(
        size: TDLoadingSize.medium,
        icon: widget.loadingIcon,
        iconColor: TDTheme.of(context).brandNormalColor,
        axis: Axis.horizontal,
        text: context.resource.refreshing,
        textColor: TDTheme.of(context).fontGyColor3,
      );

  Widget _buildInitial(BoxConstraints constraint) {
    return Opacity(
      opacity: min(constraint.maxHeight / 28, 1),
      child: Container(
        alignment: Alignment.center,
        color: widget.backgroundColor,
        child: constraint.maxHeight < 48.0
            ? Container()
            : TDText(
                context.resource.releaseRefresh,
                font: TDTheme.of(context).fontBodyMedium,
                textColor: TDTheme.of(context).fontGyColor3,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isRefresh = _refreshState == IndicatorMode.processing ||
        _refreshState == IndicatorMode.armed;

    var isInitial = _refreshState == IndicatorMode.inactive ||
        _refreshState == IndicatorMode.drag;

    return Stack(
      children: <Widget>[
        Positioned(
          top: 0.0,
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: LayoutBuilder(
            builder: (_, constraint) => Container(
                alignment: Alignment.center,
                height: widget.refreshIndicatorExtent,
                color: widget.backgroundColor,
                child: Visibility(
                  visible: isRefresh,
                  replacement: Visibility(
                    visible: isInitial,
                    child: _buildInitial(constraint),
                  ),
                  child: Container(
                    child: _buildLoading(),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
