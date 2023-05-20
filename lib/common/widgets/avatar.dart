import 'package:flutter/material.dart';
import 'package:guxin_ai/common/assets.dart';
import 'package:guxin_ai/common/routers/routeFade.dart';
import 'package:guxin_ai/common/widgets/image_cache.dart';

import 'image_browser.dart';

Widget avatar({String? avatarUrl, Function? onClick, BuildContext? context}) {
  avatarUrl = avatarUrl ?? Assets.defaultAvatar;
  return InkWell(
    child: CircleAvatar(
        child: ImageCacheWidget(
      avatarUrl,
      cacheImageType: avatarUrl.startsWith("assets/") ? CacheImageType.asserts : CacheImageType.network,
    )),
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
