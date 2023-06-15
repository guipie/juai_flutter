//upgrade_card.dart文件
import 'package:JuAI/common/assets.dart';
import 'package:flutter/material.dart';

class UpgradeCard extends StatefulWidget {
  ///标题
  String title;

  ///更新内容
  String message;

  ///确认按钮
  String positiveBtn;

  ///取消按钮
  String negativeBtn;

  ///确定按钮回调
  final GestureTapCallback positiveCallback;

  ///取消按钮回调
  final GestureTapCallback negativeCallback;

  ///条形下载进度条，默认不展示
  bool hasLinearProgress;

  UpgradeCard({this.title = "", this.message = "", this.positiveBtn = "", this.negativeBtn = "", required this.positiveCallback, required this.negativeCallback, this.hasLinearProgress = false});

  final _upgradeCardState = _UpgradeCardState();

  @override
  _UpgradeCardState createState() => _upgradeCardState;

  /// 外部更新函数
  void updateProgress(String title, String message, String positiveBtn, String negativeBtn, bool hasLinearProgress, double progress) => _upgradeCardState.updateProgress(title, message, positiveBtn, negativeBtn, hasLinearProgress, progress);
}

class _UpgradeCardState extends State<UpgradeCard> {
  /// 进度条数值
  double progress = 0;

  /// 内部更新函数
  void updateProgress(String title, String message, String positiveBtn, String negativeBtn, bool hasLinearProgress, double progress) {
    setState(() {
      widget.title = title;
      widget.message = message;
      widget.positiveBtn = positiveBtn;
      widget.negativeBtn = negativeBtn;
      widget.hasLinearProgress = hasLinearProgress;
      progress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    var messageStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, decoration: TextDecoration.none, color: Color(0xFF333130), height: 1.6);

    return Center(
      child: Container(
        width: 320,
        padding: EdgeInsets.only(bottom: 17),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //背景图片
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  Assets.logo,
                  width: 320,
                ),
              ),
            ),

            ///标题
            Visibility(
              visible: widget.title.isNotEmpty,
              child: Container(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, decoration: TextDecoration.none, color: Color(0xFF333130)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            ///更新内容
            Container(
                width: 280,
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  widget.message,
                  style: messageStyle,
                  textAlign: TextAlign.left,
                )),

            // 进度条
            Visibility(
              visible: widget.hasLinearProgress,
              child: Container(
                  height: 6,
                  width: 290,
                  margin: EdgeInsets.only(bottom: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Color(0xFFFAF8F7),
                      valueColor: new AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 64, 75, 130)),
                    ),
                  )),
            ),

            ///按钮列表
            SizedBox(
              height: 60,
              child: Row(
                children: <Widget>[
                  Visibility(
                    visible: widget.negativeBtn.isNotEmpty,
                    child: Expanded(
                        child: Container(
                      child: TextButton(
                          onPressed: widget.negativeCallback,
                          child: Text(
                            widget.negativeBtn,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xffDFE2F0)),
                          )),
                    )),
                  ),
                  Container(
                    height: 60,
                    width: 0.5,
                    color: Color(0xffC0C5D6),
                  ),
                  Visibility(
                      visible: widget.positiveBtn.isNotEmpty,
                      child: Expanded(
                        child: Container(
                            child: TextButton(
                          onPressed: widget.positiveBtn != "下载中" ? widget.positiveCallback : () {},
                          child: Text(widget.positiveBtn,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 64, 75, 130),
                              )),
                        )),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
