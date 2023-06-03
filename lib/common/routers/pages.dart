import 'package:JuAI/common/store/notice.dart';
import 'package:JuAI/pages/bbs/detail/controller.dart';
import 'package:JuAI/pages/bbs/detail/view.dart';
import 'package:JuAI/pages/bbs/publish/controller.dart';
import 'package:JuAI/pages/bbs/publish/controller_special.dart';
import 'package:JuAI/pages/bbs/publish/view.dart';
import 'package:JuAI/pages/bbs/publish/view_article.dart';
import 'package:JuAI/pages/bbs/publish/view_special.dart';
import 'package:JuAI/pages/bbs/special/index.dart';
import 'package:JuAI/pages/bbs/special/view.dart';
import 'package:JuAI/pages/bbs/tag/controller.dart';
import 'package:JuAI/pages/bbs/tag/view.dart';
import 'package:JuAI/pages/bbs_chat/controller.dart';
import 'package:JuAI/pages/bbs_chat/view.dart';
import 'package:JuAI/pages/home/controler.dart';
import 'package:JuAI/pages/settings/account/pwd_reset.dart';
import 'package:JuAI/pages/settings/account/pwd_update.dart';
import 'package:JuAI/pages/settings/agreement/privacy.dart';
import 'package:JuAI/pages/settings/agreement/user.dart';
import 'package:JuAI/pages/bbs/controller.dart';
import 'package:JuAI/pages/bbs/view.dart';
import 'package:JuAI/pages/conversation/controller.dart';
import 'package:JuAI/pages/settings/about/index.dart';
import 'package:JuAI/pages/settings/account/index.dart';
import 'package:JuAI/pages/settings/account/logout.dart';
import 'package:JuAI/pages/settings/account/phone_update.dart';
import 'package:JuAI/pages/settings/backlist/index.dart';
import 'package:JuAI/pages/settings/controler.dart';
import 'package:JuAI/pages/settings/mine/controller.dart';
import 'package:JuAI/pages/settings/mine/hudong/controller.dart';
import 'package:JuAI/pages/settings/mine/hudong/view.dart';
import 'package:JuAI/pages/settings/mine/view.dart';
import 'package:JuAI/pages/settings/notification/notice.dart';
import 'package:JuAI/pages/settings/notification/notice_setting.dart';
import 'package:JuAI/pages/settings/privacy/index.dart';
import 'package:JuAI/pages/settings/account/account_vcode.dart';
import 'package:JuAI/pages/settings/view.dart';
import 'package:JuAI/pages/tools/controller.dart';
import 'package:JuAI/pages/tools/view.dart';
import 'package:JuAI/pages/conversation/chat/controller.dart';
import 'package:JuAI/pages/conversation/chat/view.dart';
import 'package:JuAI/pages/conversation/view.dart';
import 'package:JuAI/pages/home/bindings.dart';
import 'package:JuAI/pages/home/index.dart';
import 'package:JuAI/pages/home/index_pc.dart';
import 'package:JuAI/pages/settings/login/controller.dart';
import 'package:JuAI/pages/settings/login/login_view.dart';
import 'package:JuAI/pages/settings/login/login_vcode_view.dart';
import 'package:get/get.dart';

import 'routes.dart';

class MiddleWare {}

class AppPages {
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.homePc,
      page: () => const HomePcPage(),
      binding: HomeBinding(),
    ),

    //消息会话
    GetPage(
      name: Routes.homeConversation,
      page: () => const ConversationPage(),
      binding: BindingsBuilder(() => Get.lazyPut<ConversationController>(() => ConversationController())),
    ),
    GetPage(
      name: Routes.currentChat,
      page: () => const ChatPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => ChatController())),
    ),
    //ai商店相关
    GetPage(
      name: Routes.tools,
      page: () => const ToolsPage(),
      binding: BindingsBuilder(() => Get.lazyPut<ToolsController>(() => ToolsController())),
    ),
    //社区相关
    GetPage(
      name: Routes.bbs,
      page: () => const BbsPage(),
      binding: BindingsBuilder(() => Get.put<BbsController>(BbsController())),
    ),
    GetPage(
      name: Routes.bbsPublishDongtai,
      page: () => PublishDongtaiPage(),
      binding: BindingsBuilder(() => Get.put<PublishController>(PublishController())),
    ),
    GetPage(
      name: Routes.bbsPublishArticle,
      page: () => PublishArticlePage(),
      binding: BindingsBuilder(() => Get.put<PublishController>(PublishController())),
    ),
    GetPage(
      name: Routes.bbsPublishSpecial,
      page: () => PublishSpecialPage(),
      binding: BindingsBuilder(() => Get.put<PublishSpecialController>(PublishSpecialController())),
    ),
    GetPage(
      name: Routes.bbsDetail,
      page: () => BbsDetailPage(),
      binding: BindingsBuilder(() => Get.put<ContentDetailController>(ContentDetailController())),
    ),
    GetPage(
      name: Routes.bbsSpecial,
      page: () => SpecialPage(),
      binding: BindingsBuilder(() => Get.put<SpecialController>(SpecialController())),
    ),

    GetPage(
      name: Routes.bbsTag,
      page: () => TagPage(),
      binding: BindingsBuilder(() => Get.put<TagController>(TagController())),
    ),

    ///gpt相关
    GetPage(
      name: Routes.bbsChat,
      page: () => BbsChatPage(),
      binding: BindingsBuilder(() => Get.put<BbsChatController>(BbsChatController())),
    ),

    //设置相关
    GetPage(
      name: Routes.settings,
      page: () => SettingsPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => SettingsController())),
    ),
    GetPage(
      name: Routes.settingsAccount,
      page: () => const SettingsAccountPage(),
    ),
    GetPage(
      name: Routes.settingsNotice,
      page: () => SettingsNoticePage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => NoticeStore())),
    ),
    GetPage(
      name: Routes.settingsNoticeSetting,
      page: () => SettingsNotificationSettingPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => NoticeStore())),
    ),
    GetPage(
      name: Routes.settingsPrivacy,
      page: () => const SettingsPrivacyPage(),
    ),
    GetPage(
      name: Routes.settingsUpdatePwd,
      page: () => const PasswordUpdatePage(),
    ),
    GetPage(
      name: Routes.settingsUpdatePhone,
      page: () => const AccountPhoneUpdatePage(),
    ),
    GetPage(
      name: Routes.settingsEnterVcode,
      page: () => const VerifyCodePage(),
    ),
    GetPage(
      name: Routes.settingsMineHome,
      page: () => SettingsMineHomeWidget(),
      binding: BindingsBuilder(() => Get.lazyPut(() => SettingsMineHomeController())),
    ),
    GetPage(
      name: Routes.settingsMineHudong,
      page: () => SettingMyHudongPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => SettingMyHudongController())),
    ),

    GetPage(
      name: Routes.settingsLoginout,
      page: () => const AccountLogoutPage(),
    ),
    GetPage(
      name: Routes.settingsLogin,
      page: () => LoginPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
    ),
    GetPage(
      name: Routes.settingsLoginByVocde,
      page: () => LoginVerifyCodePage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
    ),
    GetPage(
      name: Routes.settingsForgetPwd,
      page: () => const PasswordResetPage(),
    ),
    GetPage(
      name: Routes.settingsBacklist,
      page: () => const SettingsBacklistPage(),
    ),
    GetPage(
      name: Routes.settingsAbout,
      page: () => const SettingsAboutPage(),
    ),
    GetPage(
      name: Routes.settingsAgreementPrivacy,
      page: () => const AgreementPrivacyPage(),
    ),
    GetPage(
      name: Routes.settingsAgreementUser,
      page: () => const AgreementUserPage(),
    ),
    //公共
  ];
}
