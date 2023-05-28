import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JuAI/common/assets.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/store/store.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:JuAI/pages/settings/controler.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/common/widgets/cell.dart';
import 'package:JuAI/common/theme.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  SettingsPage({Key? key}) : super(key: key);
  final logic = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
        actions: [
          TextButton(
            onPressed: () {},
            child: SvgImageWidget(
              Assets.iconToken,
              width: 23,
              height: 23,
              color: Colors.amber,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.settingsAccount),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: const BoxDecoration(
                          border: Border(
                        bottom: BorderSide(width: .5, color: Colors.transparent),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          avatar(avatarUrl: UserStore.to.userInfo.value!.avatar, radius: 30),
                          const SizedBox(width: 12),
                          Wrap(
                            direction: Axis.vertical,
                            children: [
                              Text(
                                UserStore.to.userInfo.value!.nickName,
                                style: TextStyle(fontSize: WcaoTheme.fsXl, fontWeight: FontWeight.bold),
                              ),
                              Text(UserStore.to.userInfo.value!.userName),
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: WcaoTheme.fsXl,
                            color: WcaoTheme.secondary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Cell(
                  '我的主页',
                  onTap: () => Get.toNamed(Routes.settingsMineHome),
                  border: false,
                  isMustRight: false,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Wrap(
                    spacing: 30,
                    runSpacing: 20,
                    alignment: WrapAlignment.spaceAround,
                    children: [
                      _homeItem(Assets.iconToken, 2003, "token", context),
                      _homeItem(Assets.iconDongtai, 34, "动态", context),
                      _homeItem(Assets.iconHudong, 1003, "互动", context),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Cell(
                  '消息通知',
                  onTap: () => Get.toNamed(Routes.settingsNotice),
                ),
                Cell(
                  '隐私设置',
                  onTap: () => Get.toNamed(Routes.settingsPrivacy),
                ),
                Cell(
                  '清除缓存',
                  right: Text(
                    '190M',
                    style: TextStyle(fontSize: WcaoTheme.fsL),
                  ),
                  onTap: () => bottomConfirm(context),
                ),
                Cell('关于我们', onTap: () => Get.toNamed(Routes.settingsAbout)),
                Cell(
                  '退出登录',
                  border: false,
                  onTap: () => UserStore.to.onLogout(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _homeItem(String iconSvg, int num, String title, BuildContext context) {
    var numStr = num > 1000 ? "${num ~/ 1000}k+" : "$num";
    return Column(
      children: [
        SvgImageWidget(iconSvg),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            children: [
              TextSpan(text: numStr),
              TextSpan(text: title, style: TextStyle(color: WcaoTheme.placeholder, fontSize: WcaoTheme.fsSm)),
            ],
          ),
        ),
      ],
    );
  }

  Future<dynamic> bottomConfirm(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      '清除所有缓存记录',
                      style: TextStyle(
                        color: WcaoTheme.secondary,
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 12),
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1,
                              color: WcaoTheme.outline,
                            ),
                          ),
                        ),
                        child: Text(
                          '清除缓存',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: WcaoTheme.fsXl,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => Get.back(),
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '取消',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: WcaoTheme.fsXl,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
