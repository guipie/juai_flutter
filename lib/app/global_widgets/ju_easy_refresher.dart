import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart'
    show
        ClassicFooter,
        ClassicHeader,
        EasyRefresh,
        EasyRefreshController,
        IndicatorPosition,
        IndicatorResult;
import 'package:flutter/material.dart';

class JuEasyRefresher extends StatefulWidget {
  const JuEasyRefresher({
    super.key,
    required this.easyRefreshController,
    this.onLoad,
    this.onRefresh,
    required this.childBuilder,
    this.indicatorPosition = IndicatorPosition.behind,
  });

  // EasyRefreshController实例，用于控制刷新和加载的状态
  final EasyRefreshController? easyRefreshController;

  // 加载回调函数
  final FutureOr<dynamic> Function()? onLoad;

  // 刷新回调函数
  final FutureOr<dynamic> Function()? onRefresh;

  // 构建子组件的回调函数
  final Widget Function(BuildContext context, ScrollPhysics physics)?
      childBuilder;

  // 指示器的位置，默认为上方
  final IndicatorPosition indicatorPosition;

  @override
  State<JuEasyRefresher> createState() => _JuEasyRefresherState();
}

class _JuEasyRefresherState extends State<JuEasyRefresher> {
  @override
  Widget build(BuildContext context) {
    return EasyRefresh.builder(
      // 在开始刷新时立即触发刷新
      refreshOnStart: true,
      // 刷新完成后重置刷新状态
      resetAfterRefresh: true,
      // 同时触发刷新和加载的回调函数
      simultaneously: true,
      // 加载回调函数
      onLoad: () async {
        await widget.onLoad?.call();
        return IndicatorResult.fail;
      },
      // 刷新回调函数
      onRefresh: () async {
        await widget.onRefresh?.call();
        return IndicatorResult.success;
      },
      // 指定刷新时的头部组件
      header: ClassicHeader(
        hitOver: true,
        safeArea: true,
        showMessage: true,
        showText: true,
        position: widget.indicatorPosition,
        // 下面是一些文本配置
        // processingText: "正在刷新...",
        // readyText: "正在刷新...",
        // armedText: "释放以刷新",
        // dragText: "下拉刷新",
        // processedText: "刷新成功",
        // failedText: "刷新失败",
      ),
      // 指定加载时的底部组件
      footer: ClassicFooter(
        processedDuration: Duration.zero,
        showMessage: true,
        showText: true,
        position: widget.indicatorPosition,
        // 下面是一些文本配置
        processingText: "加载中...",
        processedText: "加载成功",
        readyText: "加载中...",
        armedText: "释放以加载更多",
        dragText: "上拉加载",
        failedText: "加载失败",
        noMoreText: "没有更多内容",
        messageText: "最后更新时间%T",
      ),
      controller: widget.easyRefreshController,
      childBuilder: widget.childBuilder,
    );
  }
}
