import 'package:flutter/material.dart';

class Gaps {
  static const blank = SizedBox.shrink();

  static const expand = Expanded(child: SizedBox());

  static Widget boldLine({
    double height = 12,
    double? width,
    Color color = const Color(0xFFF6F8FA),
  }) =>
      Container(
        height: height,
        width: width,
        color: color,
      );

  // 分割线
  static const line = Divider(
    height: 1,
    color: Color(0xFFF6F8FA),
  );

  static vLine({
    double width = 1,
    double height = double.infinity,
    Color color = const Color(0xFFF6F8FA),
  }) =>
      Container(
        color: color,
        width: width,
        height: height,
      );

  // width
  static const w1 = SizedBox(width: 1);
  static const w2 = SizedBox(width: 2);
  static const w4 = SizedBox(width: 4);
  static const w5 = SizedBox(width: 5);
  static const w6 = SizedBox(width: 6);
  static const w8 = SizedBox(width: 8);
  static const w10 = SizedBox(width: 10);
  static const w11 = SizedBox(width: 11);
  static const w12 = SizedBox(width: 12);
  static const w13 = SizedBox(width: 13);
  static const w15 = SizedBox(width: 15);
  static const w16 = SizedBox(width: 16);
  static const w20 = SizedBox(width: 20);
  static const w24 = SizedBox(width: 24);
  static const w25 = SizedBox(width: 25);
  static const w30 = SizedBox(width: 30);
  static const w40 = SizedBox(width: 40);
  static const w50 = SizedBox(width: 50);

  // height
  static const h1 = SizedBox(height: 1);
  static const h2 = SizedBox(height: 2);
  static const h3 = SizedBox(height: 3);
  static const h4 = SizedBox(height: 4);
  static const h5 = SizedBox(height: 5);
  static const h6 = SizedBox(height: 6);
  static const h7 = SizedBox(height: 7);
  static const h8 = SizedBox(height: 8);
  static const h10 = SizedBox(height: 10);
  static const h11 = SizedBox(height: 11);
  static const h12 = SizedBox(height: 12);
  static const h13 = SizedBox(height: 13);
  static const h15 = SizedBox(height: 15);
  static const h16 = SizedBox(height: 16);
  static const h18 = SizedBox(height: 18);
  static const h20 = SizedBox(height: 20);
  static const h24 = SizedBox(height: 24);
  static const h25 = SizedBox(height: 25);
  static const h26 = SizedBox(height: 26);
  static const h27 = SizedBox(height: 27);
  static const h30 = SizedBox(height: 30);
  static const h36 = SizedBox(height: 36);
  static const h40 = SizedBox(height: 40);
  static const h48 = SizedBox(height: 48);
  static const h52 = SizedBox(height: 52);
  static const h56 = SizedBox(height: 56);
  static const h60 = SizedBox(height: 60);
  static const h80 = SizedBox(height: 80);
  static const h100 = SizedBox(height: 100);
  static const h134 = SizedBox(height: 134);
}
