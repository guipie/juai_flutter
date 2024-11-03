// import 'package:chat_bot/base.dart';
// import 'package:chat_bot/components/list/list_state.dart';
// import 'package:easy_refresh/easy_refresh.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// typedef ToastFunction = void Function(String error, {Error? e});

// /*
// https://github.com/SeongBrave/riverpod_shop_demo/blob/main/lib/state/list_view_notifier.dart
// 1. 首次进来显示loadding，第二次就系那是refresh的动画
// 2. 错误也是首次进来发生错误才显示，第二次就toast
// */
// class ListViewStateNotifier<T> extends StateNotifier<List<T>> {
//   ListViewStateNotifier(
//     super._state, {
//     required this.fetchItems,
//     this.pageSize = 10,
//     this.pageIndex = 1,
//   }) {
//     init();
//   }
//   final EasyRefreshController _refreshController = EasyRefreshController();

//   EasyRefreshController get refreshController => _refreshController;

//   final Future<List<T>> Function(int pageIndex, int pageSize) fetchItems;

//   int _page = 0;
//   int pageSize = 10;
//   int pageIndex = 1;
//   List<T> _items = [];

//   void init() {
//     firstLoadPage();
//   }

//   Future<void> firstLoadPage() async {
//     _page = pageIndex;
//     try {
//       final List<T> list = await fetchItems(_page, pageSize);
//       if (list.isEmpty) {
//         state = ListViewState.empty(list);
//       } else {
//         _items = list;
//         state = ListViewState.ready(list);
//       }
//       _refreshController.finishLoad();
//       _refreshController.resetFooter();
//       _page += 1;
//     } catch (e) {
//       state = ListViewState.error(error: e.toString());
//     }
//   }

//   Future<void> refreshData({ToastFunction? fnToast}) async {
//     _page = pageIndex;
//     try {
//       final List<T> list = await fetchItems(_page, pageSize);
//       if (list.isEmpty) {
//         state = const ListViewState.empty();
//       } else {
//         _items = list;
//         // state = ListViewState.ready(list);
//         state = const ListViewState.error(error: "发生错误啦");
//       }
//       _refreshController.finishRefresh();
//       _refreshController.resetHeader();
//       _page += 1;
//     } catch (e) {
//       _refreshController.finishRefresh(IndicatorResult.fail);
//       if (fnToast != null) {
//         fnToast(e.toString());
//       }
//       // state = ListViewState.error(error: e.toString());
//     }
//   }

//   Future<void> loadMore({ToastFunction? fnToast}) async {
//     try {
//       final List<T> list = await fetchItems(_page, pageSize);
//       if (list.isNotEmpty) {
//         _items.addAll(list);
//         state = ListViewState.ready(_items);
//       }
//       _refreshController.finishLoad(IndicatorResult.success);
//       _page += 1;
//     } catch (e) {
//       _refreshController.finishLoad(IndicatorResult.fail);
//       // state = ListViewState.error(error: e.toString());
//       if (fnToast != null) {
//         fnToast(e.toString());
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _refreshController.dispose();
//     super.dispose();
//   }
// }
