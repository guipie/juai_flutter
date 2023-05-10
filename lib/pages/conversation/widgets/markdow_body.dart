import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/config/configs.dart';
import 'package:markdown_widget/widget/all.dart';

class ConversationWidgets {
  Widget buildMarkdown(BuildContext context, String content) {
    codeWrapper(child, text) => CodeWrapperWidget(child: child, text: text);
    return MarkdownWidget(
      shrinkWrap: true,
      data: content,
      config: (Get.isDarkMode ? MarkdownConfig.darkConfig : MarkdownConfig.defaultConfig).copy(
        configs: [
          LinkConfig(
            onTap: (url) {
              debugPrint(url);
            },
          ),
          (Get.isDarkMode ? PreConfig.darkConfig : const PreConfig()).copy(wrapper: codeWrapper),
        ],
      ),
    );
  }
}

class CodeWrapperWidget extends StatefulWidget {
  final Widget child;
  final String text;

  const CodeWrapperWidget({Key? key, required this.child, required this.text}) : super(key: key);

  @override
  State<CodeWrapperWidget> createState() => _PreWrapperState();
}

class _PreWrapperState extends State<CodeWrapperWidget> {
  late Widget _switchWidget;
  bool hasCopied = false;

  @override
  void initState() {
    super.initState();
    _switchWidget = Icon(Icons.copy_rounded, key: UniqueKey());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Align(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              child: AnimatedSwitcher(
                child: _switchWidget,
                duration: Duration(milliseconds: 200),
              ),
              onTap: () async {
                if (hasCopied) return;
                await Clipboard.setData(ClipboardData(text: widget.text));
                _switchWidget = Icon(Icons.check, key: UniqueKey());
                refresh();
                Future.delayed(Duration(seconds: 2), () {
                  hasCopied = false;
                  _switchWidget = Icon(Icons.copy_rounded, key: UniqueKey());
                  refresh();
                });
              },
            ),
          ),
          alignment: Alignment.topRight,
        )
      ],
    );
  }

  void refresh() {
    if (mounted) setState(() {});
  }
}
