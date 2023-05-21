import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:guxin_ai/common/theme.dart';

class BottommostWidget extends StatelessWidget {
  const BottommostWidget(this.isLoading, {super.key});
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const GFLoader(
            type: GFLoaderType.circle,
          )
        : Container(
            padding: const EdgeInsets.only(top: 12, bottom: 48, left: 48, right: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  height: .5,
                  color: WcaoTheme.placeholder,
                )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('我是有底线的', style: TextStyle(color: WcaoTheme.placeholder)),
                ),
                Expanded(
                    child: Container(
                  height: .25,
                  color: WcaoTheme.placeholder,
                )),
              ],
            ),
          );
  }
}
