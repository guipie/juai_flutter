import 'dart:io';

import 'package:JuAI/common/apis/statistics_api.dart';
import 'package:JuAI/common/store/store.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/common/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'state.dart';

class SettingsController extends GetxController {
  SettingsController();

  final state = SettingsState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    if (UserStore.to.isLogin) {
      StatisticsApi.homeStatistics().then((value) {
        state.contentsNum.value = value["ContentNum"] ?? 0;
        state.hudongNum.value = value["HudongNum"] ?? 0;
      });
    }
    loadCache();
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  ///加载缓存
  Future<void> loadCache() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      debugPrint('临时目录大小${tempDir.path}: ' + value.toString());
      state.totalCache.value = _renderSize(value);
    } catch (err) {
      debugPrint("获取缓存出错了$err");
    }
  }

  /// 递归方式 计算文件的大小
  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    try {
      if (file is File) {
        int length = await file.length();
        return double.parse(length.toString());
      }
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        double total = 0;
        for (final FileSystemEntity child in children) {
          total += await _getTotalSizeOfFilesInDir(child);
        }
        return total;
      }
      return 0;
    } catch (e) {
      return 0;
    }
  }

  ///格式化文件大小
  _renderSize(double value) {
    List<String> unitArr = <String>[]
      ..add('B')
      ..add('K')
      ..add('M')
      ..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(0);
    return size + unitArr[index];
  }

  void clearCache(BuildContext context) async {
    //此处展示加载loading
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      '清除所有缓存记录',
                      style: TextStyle(
                        color: WcaoTheme.secondary,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        try {
                          Loading.loading("清理中...");
                          Get.back();
                          Directory tempDir = await getTemporaryDirectory();
                          //删除缓存目录
                          await delDir(tempDir);
                          await loadCache();
                          Loading.dismiss();
                          Loading.success('清除缓存成功');
                        } catch (e) {
                          Loading.error('清除缓存失败');
                        } finally {}
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 12),
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1,
                              color: WcaoTheme.outline,
                            ),
                          ),
                        ),
                        child: Text(
                          '清除缓存',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: WcaoTheme.fsXl,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => Get.back(),
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '取消',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: WcaoTheme.fsXl,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ///递归方式删除目录
  Future<void> delDir(FileSystemEntity file) async {
    try {
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        for (final FileSystemEntity child in children) {
          await delDir(child);
        }
      }
      await file.delete();
    } catch (e) {
      debugPrint("缓存清理出错$e");
    }
  }
}
