import 'package:juai/common/assets.dart';
import 'package:flutter/material.dart';
import 'package:juai/common/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markdown_widget/markdown_widget.dart';

class AgreementPrivacyPage extends StatefulWidget {
  const AgreementPrivacyPage({Key? key}) : super(key: key);

  @override
  State<AgreementPrivacyPage> createState() => _AgreementPrivacyPageState();
}

class _AgreementPrivacyPageState extends State<AgreementPrivacyPage> {
  var md = "";
  @override
  void initState() {
    rootBundle.loadString(Assets.privacyMd).then((value) {
      setState(() {
        md = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("隐私政策"), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 1.sh,
            padding: const EdgeInsets.all(16),
            child: MarkdownWidget(
              data: md,
              padding: const EdgeInsets.only(bottom: 100),
            ),
          ),
        ),
      ),
    );
  }
}
