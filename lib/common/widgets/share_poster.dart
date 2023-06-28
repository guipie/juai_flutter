// 主要思路：

// 就是利用RenderRepaintBoundary   将 需要保存的那部分 ui包裹 起来，利用 key 将两者关联，

// 然后使用 RenderRepaintBoundary     的 toImage()方法转成 图片

// 再装成字节

// 然后使用  await QSCommon.saveImageToCamera(byteData!);  保存到手机

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'package:flutter/services.dart';
import 'package:juai/common/assets.dart';

import 'package:qr_flutter/qr_flutter.dart';

import 'dart:ui' as ui;

class SharePosterWidget extends StatefulWidget {
  const SharePosterWidget({Key? key}) : super(key: key);

  @override
  State<SharePosterWidget> createState() => _SharePosterWidgetState();
}

class _SharePosterWidgetState extends State<SharePosterWidget> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://img0.baidu.com/it/u=1205692001,983151583&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=641"), fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            //海报区域
            qrWidget(),
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      saveImage();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      color: Colors.white,
                      child: const Text(
                        "保存图片",
                        style: TextStyle(color: Colors.orange, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  qrWidget() {
    return RepaintBoundary(
        key: _globalKey,
        child: Column(
          children: [
            Container(
              height: 600,
              width: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/avart.webp"), //这是本地随便找的图片

                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 100,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      child: QrImageView(
                        data: 'This QR code has an embedded image as well',
                        version: QrVersions.auto,
                        size: 320,
                        gapless: false,
                        embeddedImage: AssetImage(Assets.imageBj),
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: Size(80, 80),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  //保存图片

  saveImage() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary; //这里记得要  as RenderRepaintBoundary

      //ui转图片(生成截图)

      double dpr = 900; // 获取当前设备的像素比

      ui.Image image = await boundary.toImage(pixelRatio: dpr);

      //生成字节 (可以将图片转成字节的)

      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      //保存图片到相册

      File file = File("path");

      debugPrint('$file');

      if (file.path.length > 0) {
        print("保存成功");
      } else {
        print("保存失败");
      }
    } catch (e) {
      print("出现异常");
    }
  }
}
