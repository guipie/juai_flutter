import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class Skeletons {
  static Widget rowCard({
    int cardCount = 1,
    double? h,
  }) {
    final w = cardCount == 1 ? 0.9.sw : ((1 - 0.2) / (cardCount > 3 ? 3 : cardCount)).sw;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 1; i <= cardCount; i++)
              Container(
                width: w,
                height: h ?? 0.15.sh,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }

  static Widget card({
    double width = 200,
    double height = 200,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }
}
