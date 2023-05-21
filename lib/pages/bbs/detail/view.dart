import 'package:flutter/material.dart';
import 'package:guxin_ai/common/theme.dart';

class BbsDetailPage extends StatefulWidget {
  const BbsDetailPage({super.key});

  @override
  _BbsDetailPageState createState() => _BbsDetailPageState();
}

class _BbsDetailPageState extends State<BbsDetailPage> {
  List<String> comments = ['这篇文章很不错！', '非常棒的分享，谢谢！', '我学到了很多知识。'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [TextField(), TextField(), TextField(), TextField(), TextField(), TextField(), TextField(), TextField(), TextField(), TextField(), TextField()],
          ),
        ),
      ),
    );
  }
}
