import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juai_flutter/app/data/model/chat.dart';
import 'package:juai_flutter/app/demo_data.dart';
import 'package:juai_flutter/app/global_widgets/refresh/paging_mixin.dart';

class ConversationController extends GetxController with StateMixin, PagingMixin<Chat> {
  ScrollController scrollController = ScrollController();

  bool isFirst = false;
  var data = RxList<Chat>.empty();
  var titleOpacity = 0.0.obs;

  var online = true.obs;

  void showMenu() {
    showModalBottomSheet(
      context: Get.context!,
      useSafeArea: false,
      barrierColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          height: 300,
          margin: const EdgeInsets.all(10),
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                width: 40,
                height: 3,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(3)),
              ),
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 21 / 9,
                  ),
                  children: [
                    ElevatedButton(
                      onPressed: test1,
                      child: Text(
                        "收到新消息",
                        style: Theme.of(Get.context!).textTheme.bodySmall,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: test2,
                      child: Text(
                        "删除好友",
                        style: Theme.of(Get.context!).textTheme.bodySmall,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: test4,
                      child: Text(
                        "掉线",
                        style: Theme.of(Get.context!).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void addTest() {
    if (data.firstOrNull?.name == "Hi") {
      data.first.unread++;
      data.first.msg = "new msg ${DateTime.now().second}";
      change(null, status: RxStatus.success());
    } else {
      Chat chat = Chat();
      chat.name = "Hi";
      chat.timestamp = "Jan 5";
      chat.unread = 1;
      chat.msg = "${DateTime.now().second}new game coming";
      chat.portrait = "https://th.wallhaven.cc/small/we/wemrd7.jpg";
      data.insert(0, chat);
      change(null, status: RxStatus.success());
    }
  }

  void test1() async {
    Get.back();
    await Future.delayed(const Duration(seconds: 1));
    addTest();
    for (var i = 0; i < 20; i++) {
      await Future.delayed(const Duration(milliseconds: 600));
      addTest();
    }
  }

  void test2() async {
    Get.back();
    for (var i = 0; i < 3; i++) {
      if (data.length >= 2) {
        data.removeAt(1);
      }
    }
    change(null, status: RxStatus.success());
  }

  void test4() async {
    Get.back();
    await Future.delayed(const Duration(milliseconds: 200));
    for (var item in data) {
      item.online = false;
    }
    online.value = false;
    change(null, status: RxStatus.success());
  }

  @override
  Future fecthData(int page) async {
    if (isFirst == true) {
      isFirst = true;
      endLoad([], maxCount: 22);
      return;
    }
    await Future.delayed(const Duration(seconds: 2));
    endLoad(DemoData.getConversations(), maxCount: 32);
    debugPrint("当前页面：$page,总数量：${items.length}");
  }
}
