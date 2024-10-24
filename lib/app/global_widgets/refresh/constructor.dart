import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'paging_mixin.dart';
import 'pull_refresh_control.dart';
import 'refresh_footer.dart';

/// 快速构建 `ListView` 形式的分页列表
/// 其他详细参数查看 [ListView]
class SpeedyPagedList<T> extends StatelessWidget {
  const SpeedyPagedList({
    super.key,
    required this.controller,
    required this.itemBuilder,
    this.scrollController,
    this.padding,
    this.header,
    this.locatorMode = false,
    this.emptyView,
    this.loadingPlaceholderView,
    this.animateTransitions = false,
  })  : _separatorBuilder = null,
        _itemHeaderBuilder = null,
        _itemFooterBuilder = null;

  /// 带分割间隔组件
  const SpeedyPagedList.separated({
    super.key,
    required this.controller,
    required this.itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    this.scrollController,
    this.padding,
    this.header,
    this.locatorMode = false,
    this.emptyView,
    this.loadingPlaceholderView,
    this.animateTransitions = false,
  })  : _separatorBuilder = separatorBuilder,
        _itemHeaderBuilder = null,
        _itemFooterBuilder = null;

  /// 带分组顶部/底部组件
  const SpeedyPagedList.itemGroup({
    super.key,
    required this.controller,
    required this.itemBuilder,
    IndexedWidgetBuilder? separatorBuilder,
    IndexedWidgetBuilder? itemFooterBuilder,
    IndexedWidgetBuilder? itemHeaderBuilder,
    this.scrollController,
    this.padding,
    this.header,
    this.locatorMode = false,
    this.emptyView,
    this.loadingPlaceholderView,
    this.animateTransitions = false,
  })  : _separatorBuilder = separatorBuilder,
        _itemFooterBuilder = itemFooterBuilder,
        _itemHeaderBuilder = itemHeaderBuilder;

  final PagingMixin<T> controller;

  final Widget Function(BuildContext context, int index, T item) itemBuilder;

  final Header? header;

  final bool locatorMode;

  /// 参照 [ScrollView.controller].
  final ScrollController? scrollController;

  /// 参照 [ListView.itemExtent].
  final EdgeInsetsGeometry? padding;

  /// 参照 [ListView.separator].
  final IndexedWidgetBuilder? _separatorBuilder;

  /// 每个item之间的间隔顶部
  final IndexedWidgetBuilder? _itemHeaderBuilder;

  /// 每个item之间的间隔底部
  final IndexedWidgetBuilder? _itemFooterBuilder;

  final WidgetBuilder? loadingPlaceholderView;
  final WidgetBuilder? emptyView;
  final bool animateTransitions;

  @override
  Widget build(BuildContext context) {
    return PageRefreshControl(
      pagingMixin: controller,
      header: header,
      locatorMode: locatorMode,
      childBuilder: (context, physics) {
        if (_itemHeaderBuilder != null || _itemFooterBuilder != null) {
          return PagedListView<int, T>.separated(
            physics: physics,
            padding: padding,
            pagingController: controller.pagingController,
            builderDelegate: pagedChildDelegate(
              (context, item, index) {
                return Column(
                  children: [
                    if (_itemHeaderBuilder != null) _itemHeaderBuilder.call(context, index),
                    itemBuilder.call(context, index, item),
                    if (_itemFooterBuilder != null) _itemFooterBuilder.call(context, index),
                  ],
                );
              },
              loadingPlaceholderView: loadingPlaceholderView,
              emptyView: emptyView,
              animateTransitions: animateTransitions,
            ),
            separatorBuilder: _separatorBuilder!,
          );
        }

        return _separatorBuilder != null
            ? PagedListView<int, T>.separated(
                physics: physics,
                padding: padding,
                pagingController: controller.pagingController,
                builderDelegate: pagedChildDelegate(
                  (context, item, index) {
                    return itemBuilder.call(context, index, item);
                  },
                  loadingPlaceholderView: loadingPlaceholderView,
                  emptyView: emptyView,
                  animateTransitions: animateTransitions,
                ),
                separatorBuilder: _separatorBuilder,
              )
            : PagedListView<int, T>(
                physics: physics,
                padding: padding,
                pagingController: controller.pagingController,
                builderDelegate: pagedChildDelegate(
                  (context, item, index) {
                    return itemBuilder.call(context, index, item);
                  },
                  loadingPlaceholderView: loadingPlaceholderView,
                  emptyView: emptyView,
                  animateTransitions: animateTransitions,
                ),
              );
      },
    );
  }
}

/// 快速构建 `GridView` 形式的分页列表
/// 其他详细参数查看 [GridView]
// class SpeedyPagedGrid<T> extends StatelessWidget {
//   const SpeedyPagedGrid({
//     super.key,
//     required this.controller,
//     required this.itemBuilder,
//     required this.gridDelegate,
//     this.scrollController,
//     this.padding,
//     this.header,
//     this.locatorMode = false,
//     this.refreshOnStart = true,
//     this.startRefreshHeader,
//   });

//   final PagingMixin controller;
//   final Widget Function(BuildContext context, int index, T item) itemBuilder;

//   final Header? header;

//   final bool refreshOnStart;
//   final Header? startRefreshHeader;
//   final bool locatorMode;

//   /// 参照 [ScrollView.controller].
//   final ScrollController? scrollController;

//   /// 参照 [ListView.itemExtent].
//   final EdgeInsetsGeometry? padding;

//   /// 参照 [GridView.gridDelegate].
//   final SliverGridDelegate gridDelegate;

//   @override
//   Widget build(BuildContext context) {
//     return PullRefreshControl(
//       pagingMixin: controller,
//       header: header,
//       refreshOnStart: refreshOnStart,
//       startRefreshHeader: startRefreshHeader,
//       locatorMode: locatorMode,
//       childBuilder: (context, physics) {
//         return GridView.builder(
//           physics: physics,
//           padding: padding,
//           controller: scrollController,
//           gridDelegate: gridDelegate,
//           itemCount: controller.pagingController.itemCount,
//           itemBuilder: (context, index) {
//             final item = controller.items[index];
//             return itemBuilder.call(context, index, item);
//           },
//         );
//       },
//     );
//   }
// }
//
