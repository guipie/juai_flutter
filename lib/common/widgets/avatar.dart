import 'package:flutter/material.dart';
import 'package:JuAI/common/assets.dart';
import 'package:JuAI/common/routers/routeFade.dart';
import 'package:JuAI/common/config.dart';
import 'package:JuAI/common/utils/qiniu_sdk.dart';

import 'image_browser.dart';

Widget avatar({String? avatarUrl, double radius = 22, Function? onClick, BuildContext? context}) {
  avatarUrl = (avatarUrl == null || avatarUrl.isEmpty) ? Assets.defaultAvatar : avatarUrl;
  debugPrint("avatarUrlavatarUrlavatarUrlavatarUrl$avatarUrl");
  ImageProvider? image;
  if (avatarUrl.isEmpty) {
    image = const AssetImage(Assets.robotAvatar);
  } else if (avatarUrl.startsWith("assets/")) {
    image = AssetImage(avatarUrl);
  } else {
    image = NetworkImage(QiniuUtil.getImageThumbnail(Qiniu_External_domain + avatarUrl, width: 90, height: 90));
  }
  return InkWell(
    child: CircleAvatar(
      backgroundImage: image,
      radius: radius,
    ),
    onTap: () {
      if (onClick == null) {
        if (context != null) {
          Navigator.of(context).push(
            RouteFade(
              page: GxImageBrowser(imgDataArr: [avatarUrl!], index: 0),
            ),
          );
        }
      } else {
        onClick.call();
      }
    },
  );
}

Widget aiAvatar(String? url, {Function? onClick}) {
  if (url == null || url.isEmpty) {
    return InkWell(
      child: const CircleAvatar(backgroundImage: AssetImage(Assets.robotAvatar)),
      onTap: () => onClick,
    );
  }
  return avatar(avatarUrl: url);
}
