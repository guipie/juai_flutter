import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

/// 分页控制器
///
/// `on GetxController` 简化使用过程
mixin PagingMixin<T> on GetxController {
  /// 初始页码
  int initPage = 1;

  /// 当前页码
  int _page = 1;
  final List<int> _pages = [];

  /// 刷新控制器
  PagingController<int, T> _pagingController = PagingController(firstPageKey: 1);
  PagingController<int, T> get pagingController => _pagingController;

  /// 预置刷新控制器
  EasyRefreshController refreshController = EasyRefreshController();

  /// 控制刷新结束回调（异步处理）
  Completer? _refreshComplater;

  /// 数据列表
  List<T> get items => _pagingController.itemList ?? [];

  /// on GetxController 简化使用过程
  ///
  /// 也可以指定其他数据包含生命周期函数的类别，eg `State<T extends StatefulWidget> `
  @override
  void onInit() {
    super.onInit();
    _pagingController = PagingController(firstPageKey: initPage);
    _pagingController.addPageRequestListener((pageKey) {
      _page = pageKey;
      if (_pages.contains(_page) && _page != 1) return;
      fecthData(pageKey);
      _pages.add(_page);
    });
  }

  /// 挂载分页器
  /// `initPage` 初始页码值(分页起始页)
  /// `startLoading` 是否启动加载
  // void initPaging({
  //   int initPage = 1,
  //   bool startLoading = true,
  // }) {
  //   // 重置分页器
  //   if (_initPage != initPage) {
  //     _initPage = initPage;
  //     _pagingController.dispose();
  //     _pagingController = PagingController(firstPageKey: initPage);
  //   }

  //   _pagingController.addPageRequestListener((pageKey) {
  //     _page = pageKey;
  //     fecthData(pageKey);
  //   });
  // }

  /// 获取数据
  FutureOr fecthData(int page);

  /// 刷新数据
  Future onRefresh() async {
    _refreshComplater = Completer();
    _pagingController.notifyPageRequestListeners(initPage);

    // 会触发首次加载
    // _pagingController.refresh();
    return _refreshComplater!.future;
  }

  /// 获取数据后调用
  /// `items` 列表数据
  /// `maxCount` 数据总数，如果为0则默认通过 `items` 有无数据判断是否可以分页加载, null为非分页请求
  /// `error` 错误信息
  /// `insertPrevious` 首次加载时，在数据前插入目标数量得item，用于列表特殊位置插值
  void endLoad(
    List<T>? list, {
    int? maxCount,
    dynamic error,
    // int insertPrevious = 0,
  }) {
    if (_page == initPage) {
      _refreshComplater?.complete();
      _refreshComplater = null;
    }

    if (list != null) {
      bool hasNoMore = true;

      // 刷新清空历史数据列表
      if (_page == initPage && this.items.isNotEmpty) {
        updateItems([]);
      }

      // 默认没有总数量 `maxCount`，用获取当前数据列表是否有值判断
      // 默认有总数量 `maxCount`, 则判断当前请求数据list+历史数据items是否小于总数
      // bool hasNoMore = !((items.length + list.length) < maxCount);
      if (maxCount != null) {
        // debugPrint(_pagingController.itemCount);
        hasNoMore = (list.length + _pagingController.itemCount) >= maxCount;
      } else {
        hasNoMore = list.isEmpty;
      }

      if (hasNoMore) {
        _pagingController.appendLastPage(list);
      } else {
        if (list.isNotEmpty) {
          _pagingController.appendPage(list, _page + 1);
        }
      }
    } else {
      _pagingController.error = error ?? '数据请求错误';
    }
  }

  /// 更新数据列表
  void updateItems(List<T> list) {
    _pagingController.itemList = list;
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    _pagingController.notifyListeners();
  }

  /// 重置加载的错误显示
  void retryLastFailedRequest() {
    _pagingController.retryLastFailedRequest();
  }
}

extension PagingControllerEx on PagingController {
  /// 列表数量
  int get itemCount => itemList?.length ?? 0;
}
