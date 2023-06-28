import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'base_page_params.dart';
import 'base_page_state.dart';

abstract class PagingController<T extends PagingStateBase, S extends PagingState<T>> extends GetxController {
  /// PagingState
  late S pagingState;

  /// 刷新控件的 Controller
  RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();

    /// 保存 State
    pagingState = getState();
  }

  @override
  void onReady() {
    super.onReady();

    /// 进入页面刷新数据
    refreshData();
  }

  /// 刷新数据
  void refreshData() async {
    initPaging();
    await _loadData();

    /// 刷新完成
    refreshController.refreshCompleted();
  }

  ///初始化分页数据
  void initPaging() {
    pagingState.lastId = null;
    pagingState.hasMore = true;
    pagingState.data.clear();
  }

  /// 数据加载
  Future<List<T>?> _loadData() async {
    PagingParams pagingParams = PagingParams.create(lastId: pagingState.lastId);
    var pagingData = await loadData(pagingParams);

    /// 数据不为空，则将数据添加到 data 中
    /// 并且分页页数 pageIndex + 1
    if (pagingData != null && pagingData.isNotEmpty) {
      pagingState.data.addAll(pagingData);
      pagingState.lastId = pagingData.last.id;
    }

    /// 判断是否有更多数据
    pagingState.hasMore = pagingData != null && pagingData.length == pagingParams.size;
    debugPrint("是否还有数据：${pagingState.hasMore}");

    /// 更新界面
    update([pagingState.refreshId]);
    return pagingData;
  }

  /// 加载更多
  void loadMoreData() async {
    await _loadData();

    /// 加载完成
    refreshController.loadComplete();
  }

  /// 最终加载数据的方法
  Future<List<T>?> loadData(PagingParams pagingParams);

  /// 获取 State
  S getState();
}
