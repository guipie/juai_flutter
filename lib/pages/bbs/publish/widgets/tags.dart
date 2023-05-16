import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagsWidget {
  openTag() {
    Get.bottomSheet(
      Container(
        height: 180,
        child: Wrap(
          direction: Axis.vertical,
          children: [
            TextButton(onPressed: () {}, child: TextField()),
            ListTile(
              title: Text("#哈哈哈#"),
            )
          ],
        ),
      ),
    );
  }
}
