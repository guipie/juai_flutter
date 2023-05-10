import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guxin_ai/common/server.dart';
import 'package:guxin_ai/common/utils/http.dart';
import 'package:guxin_ai/common/utils/utils.dart';
import 'package:qiniu_flutter_sdk/qiniu_flutter_sdk.dart';
import 'package:path/path.dart' as path;

class QiniuUtil {
  static QiniuUtil get instance => _getInstance();
  static QiniuUtil? _instance;

  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    _instance ??= QiniuUtil._internal();
    return _instance;
  }

  late Storage storage;
  final putController = PutController();
  QiniuUtil._internal() {
    storage = Storage(
      config: Config(
        // 通过自己的 hostProvider 来使用自己的 host 进行上传
        // hostProvider: HostProvider(),
        // 可以通过实现 cacheProvider 来自己实现缓存系统支持分片断点续传
        // cacheProvider: CacheProvider,
        // 如果你需要对网络请求进行更基础的一些操作，你可以实现自己的 HttpClientAdapter 处理相关行为
        // httpClientAdapter: HttpClientAdapter,
        // 设定网络请求重试次数
        retryLimit: 3,
      ),
    );
    // 添加整体进度监听
    putController.addProgressListener((double percent) {
      debugPrint('任务进度变化：已发送：$percent');
    });

    // 添加发送进度监听
    putController.addSendProgressListener((double percent) {
      debugPrint('已上传进度变化：已发送：$percent');
    });

    // 添加状态监听
    putController.addStatusListener((StorageStatus status) {
      debugPrint('状态变化: 当前任务状态：$status');
    });
  }

  Future<String> saveFile(File file, QiniuFileType fileType, {String? key}) async {
    try {
      if (fileType == QiniuFileType.image && !GetUtils.isImage(file.path)) {
        Loading.waring("请上传正确图片");
        return Future.error("请上传正确图片");
      }
      if (fileType == QiniuFileType.video && !GetUtils.isVideo(file.path)) {
        Loading.waring("请上传正确视频");
        return Future.error("请上传正确视频");
      }
      key = key ?? dateFormat(null, fmt: "yyyyMM") + "/" + DateTime.now().millisecondsSinceEpoch.toString() + path.extension(file.path);
      return HttpUtil().post("/api/app/common/qiniu/token").then((value) async {
        var response = await storage.putFile(file, value.data, options: PutOptions(controller: putController, key: key));
        debugPrint("response.rawData:${response.rawData.toString()}，key:${response.key}，hash:${response.hash}");
        return response.key ?? "";
      });
    } catch (e) {
      Logger.write("上传出错了$e");
      return "";
    }
  }
}

enum QiniuFileType { image, video }
