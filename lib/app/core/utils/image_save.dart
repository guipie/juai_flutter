import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';

import 'permission_util.dart';

class ImageSaver {
  /// 保存二进制图片
  static bytesSave(Uint8List pngBytes) async {
    PermissionUtil().requestPhoto().then((value) async {
      if (value) {}
    });
  }

  /// 二进制转为图片
  static Future<ui.Image> bytes2image(Uint8List list) async {
    ui.Codec codec = await ui.instantiateImageCodec(list);
    ui.FrameInfo frame = await codec.getNextFrame();
    return frame.image;
  }

  /// 保存网络链接图片
  static urlSave(String imageUrl) async {
    final state = await PermissionUtil().requestPhoto();
    if (!state) return;
    var response = await Dio().get(imageUrl, options: Options(responseType: ResponseType.bytes));
    bytesSave(Uint8List.fromList(response.data));
  }
}
