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
      appBar: AppBar(
        title: const Text('文章详情'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '如何用Flutter写一个漂亮的文章详情页',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '作者：ChatGPT',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '在Flutter中，可以使用多种Widgets来构建漂亮的UI界面。在这篇文章中，我将展示如何使用Flutter来实现一个漂亮的文章详情页。',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '首先，我们需要使用Scaffold Widget来创建一个基础的页面结构。在这个基础上，我们可以添加AppBar、底部评论等其他Widget。',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(comments[index]),
                    );
                  },
                ),
              ),
              TextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.phone,
                maxLength: 11,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "请输入正确手机号、邮箱",
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: WcaoTheme.outline,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: WcaoTheme.primaryFocus,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
