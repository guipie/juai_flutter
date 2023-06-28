import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juai/common/utils/base_page/base_page_controller.dart';
import 'package:juai/common/utils/base_page/base_page_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LoadDataRefresh {
  static Widget buildRefreshListWidget<T extends PagingStateBase, C extends PagingController<T, PagingState<T>>>({
    required Widget Function(T item, int index) itemBuilder,
    bool enablePullUp = true,
    bool enablePullDown = true,
    String? tag,
    Widget Function(T item, int index)? separatorBuilder,
    Function(T item, int index)? onItemClick,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    Axis scrollDirection = Axis.vertical,
  }) {
    C controller = Get.find(tag: tag);
    return GetBuilder<C>(
      builder: (controller) {
        return _buildRefreshWidget(
          builder: () => _buildListView<T>(
            data: controller.pagingState.data,
            separatorBuilder: separatorBuilder,
            itemBuilder: itemBuilder,
            onItemClick: onItemClick,
            physics: physics,
            shrinkWrap: shrinkWrap,
            scrollDirection: scrollDirection,
          ),
          refreshController: controller.refreshController,
          onRefresh: controller.refreshData,
          onLoad: controller.loadMoreData,
          enablePullDown: enablePullDown,
          enablePullUp: enablePullUp && controller.pagingState.hasMore,
        );
      },
      tag: tag,
      id: controller.pagingState.refreshId,
    );
  }

  static Widget _buildRefreshWidget({
    required Widget Function() builder,
    VoidCallback? onRefresh,
    VoidCallback? onLoad,
    required RefreshController refreshController,
    bool enablePullUp = true,
    bool enablePullDown = true,
  }) {
    return SmartRefresher(
      enablePullUp: enablePullUp,
      enablePullDown: enablePullDown,
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoad,
      // header: const ClassicHeader(
      //   height: 40,
      //   idleText: "下拉刷新",
      //   releaseText: "松开刷新",
      //   completeText: "刷新完成",
      //   refreshingText: "加载中......",
      // ),
      header: const WaterDropHeader(complete: Text("刷新完成")),
      // footer: CustomFooter(
      //   builder: (context, mode) {
      //     return BottommostWidget(mode == LoadStatus.loading, isNodata: mode == LoadStatus.noMore);
      //   },
      // ),
      footer: ClassicFooter(
        loadStyle: LoadStyle.ShowAlways,
        idleText: GetPlatform.isDesktop ? "点击加载更多" : "上拉加载更多",
        canLoadingText: "松开加载更多",
        loadingText: "加载中......",
        noDataText: "......我是有底线的......",
        onClick: () => refreshController.requestLoading(),
      ),
      child: builder(),
    );
  }

  static Widget _buildListView<T>({
    required Widget Function(T item, int index) itemBuilder,
    required List<T> data,
    Widget Function(T item, int index)? separatorBuilder,
    Function(T item, int index)? onItemClick,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    Axis scrollDirection = Axis.vertical,
  }) {
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: EdgeInsets.zero,
      scrollDirection: scrollDirection,
      itemBuilder: (ctx, index) => GestureDetector(
        child: itemBuilder.call(data[index], index),
        onTap: () => onItemClick?.call(data[index], index),
      ),
      separatorBuilder: (ctx, index) => separatorBuilder?.call(data[index], index) ?? Container(),
      itemCount: data.length,
    );
  }
}
