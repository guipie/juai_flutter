import 'package:flutter/material.dart';
import 'package:guxin_ai/common/assets.dart';
import 'package:guxin_ai/common/routers/routeFade.dart';

import 'image_browser.dart';

Widget avatar({String? avatarUrl, double radius = 22, Function? onClick, BuildContext? context}) {
  avatarUrl = avatarUrl ?? Assets.defaultAvatar;
  ImageProvider? image;
  if (avatarUrl.startsWith("assets/")) {
    image = AssetImage(avatarUrl);
  } else {
    image = NetworkImage(avatarUrl);
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

Widget aiAvatar() {
  return const CircleAvatar(backgroundImage: AssetImage(Assets.robotAvatar));
}
