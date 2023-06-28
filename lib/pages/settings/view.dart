import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juai/common/assets.dart';
import 'package:juai/common/routers/routes.dart';
import 'package:juai/common/store/store.dart';
import 'package:juai/common/widgets/avatar.dart';
import 'package:juai/common/widgets/image_cache.dart';
import 'package:juai/pages/settings/controler.dart';
import 'package:flutter/material.dart';
import 'package:juai/common/widgets/cell.dart';
import 'package:juai/common/theme.dart';
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
            child: const SvgImageWidget(
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
                          Obx(() => avatar(avatarUrl: logic.state.avatar.value, radius: 30)),
                          const SizedBox(width: 12),
                          Wrap(
                            direction: Axis.vertical,
                            children: [
                              Obx(
                                () => Text(
                                  logic.state.nickName.value,
                                  style: TextStyle(fontSize: WcaoTheme.fsXl, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text("AI号:" + UserStore.to.userInfo.value!.userName),
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
                      _homeItem(Assets.iconToken, UserStore.to.userInfo.value!.tokenNum, "token", context),
                      Obx(
                        () => InkWell(
                          child: _homeItem(Assets.iconDongtai, logic.state.contentsNum.value, "动态", context),
                          onTap: () => Get.toNamed(Routes.settingsMineHome),
                        ),
                      ),
                      Obx(
                        () => InkWell(
                          child: _homeItem(Assets.iconHudong, logic.state.hudongNum.value, "互动", context),
                          onTap: () => Get.toNamed(Routes.settingsMineHudong),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Cell(
                  '消息通知',
                  onTap: () => Get.toNamed(Routes.settingsNotice),
                ),
                Obx(
                  () => Cell(
                    ConfigStore.to.isDarkMode.value ? "暗黑模式" : "明亮模式",
                    onTap: () => ConfigStore.to.onDarkModeChage(),
                  ),
                ),
                // Cell(
                //   '隐私设置',
                //   onTap: () => Get.toNamed(Routes.settingsPrivacy),
                // ),
                Cell(
                  '清除缓存',
                  right: Obx(
                    () => Text(
                      logic.state.totalCache.value,
                      style: TextStyle(fontSize: WcaoTheme.fsL),
                    ),
                  ),
                  onTap: () => logic.clearCache(context),
                ),
                Cell('关于我们', onTap: () => Get.toNamed(Routes.settingsAbout)),
                Cell('意见反馈', onTap: () => Get.toNamed(Routes.settingsSuggestions)),
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
    var numStr = num <= 0 ? "0" : (num > 1000 ? "${num ~/ 1000}k+" : "$num");
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
}
