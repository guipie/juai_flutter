import 'package:JuAI/common/assets.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/store/config.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/common/theme.dart';
import 'package:get/get.dart';

class SettingsAboutPage extends StatefulWidget {
  const SettingsAboutPage({Key? key}) : super(key: key);

  @override
  State<SettingsAboutPage> createState() => _SettingsAboutPageState();
}

class _SettingsAboutPageState extends State<SettingsAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于我们'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 80, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: WcaoTheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const ImageCacheWidget(
                      Assets.logo,
                      cacheImageType: CacheImageType.asserts,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Text(
                      '聚AI ~😊',
                      style: TextStyle(
                        fontSize: WcaoTheme.fsBase * 1.75,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Text(
                      ConfigStore.to.version + (ConfigStore.to.isRelease ? "-Release" : "-Debug"),
                      style: TextStyle(
                        color: WcaoTheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                    child: const Text("聚AI(juai.link)，是一款所有ai爱好者的APP;"),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                    child: const Text("在这里有最新的AI咨询，知识，和产品；"),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                    child: const Text("让它链接你我和AI；"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(Routes.settingsAgreementPrivacy),
                    child: Text(
                      '隐私政策',
                      style: TextStyle(
                        color: WcaoTheme.secondary,
                      ),
                    ),
                  ),
                  Container(
                    width: .5,
                    color: WcaoTheme.outline,
                    height: 12,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.settingsAgreementUser),
                    child: Text(
                      '用户协议',
                      style: TextStyle(
                        color: WcaoTheme.secondary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
