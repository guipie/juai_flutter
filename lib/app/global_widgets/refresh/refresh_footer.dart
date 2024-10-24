import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:juai_flutter/app/global_widgets/common/empty_data_view.dart';

import '../common/app_progress_indicator.dart';

PagedChildBuilderDelegate<ItemType> pagedChildDelegate<ItemType>(
  ItemWidgetBuilder<ItemType> builder, {
  WidgetBuilder? loadingPlaceholderView,
  WidgetBuilder? emptyView,
  WidgetBuilder? noMore,
  bool animateTransitions = false,
}) =>
    PagedChildBuilderDelegate<ItemType>(
      itemBuilder: builder,
      animateTransitions: animateTransitions,
      firstPageErrorIndicatorBuilder: emptyView ??
          (context) => const DefaultEmptyDataView(
                text: "加载出错了",
              ),
      firstPageProgressIndicatorBuilder: loadingPlaceholderView ?? (context) => const Text("占位符"),
      noItemsFoundIndicatorBuilder: emptyView ?? (context) => const DefaultEmptyDataView(),
      newPageProgressIndicatorBuilder: (_) => const LoadingFooter(),
      noMoreItemsIndicatorBuilder: noMore ?? (_) => const LoadingNoMore(),
      newPageErrorIndicatorBuilder: (_) => const _LoadingTapMore(),
    );

class RefreshFooter extends Footer {
  const RefreshFooter({
    super.triggerOffset = 70,
    super.clamping = false,
    super.processedDuration = const Duration(
      milliseconds: 500,
    ),
    super.position = IndicatorPosition.locator,
    super.safeArea = false,
    this.backgroundColor,
  });

  final Color? backgroundColor;

  @override
  Widget build(Object context, IndicatorState state) {
    Widget child = const SizedBox();

    if (state.result == IndicatorResult.noMore) {
      return const LoadingNoMore();
    }

    if (state.mode == IndicatorMode.processing) {
      return const LoadingFooter();
    }

    return child;
  }
}

class LoadingNoMore extends StatelessWidget {
  const LoadingNoMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        '— 我是有底线的 —',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey[100],
        ),
      ),
    );
  }
}

class LoadingFooter extends StatelessWidget {
  const LoadingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppProgressIndicator(
            size: 25,
            // color1: Colors.blue.withOpacity(0),
            // color2: Colors.blue,
          ),
          SizedBox(width: 8),
          Text(
            '加载中...',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingTapMore extends StatelessWidget {
  const _LoadingTapMore();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.refresh,
              size: 16,
              color: Colors.blueGrey[100],
            ),
            const SizedBox(width: 1),
            Text(
              '点击加载',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey[100],
              ),
            ),
          ],
        ));
  }
}
