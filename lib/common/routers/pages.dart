import 'package:guxin_ai/common/store/store.dart';
import 'package:guxin_ai/pages/bbs/publish/controller.dart';
import 'package:guxin_ai/pages/bbs/publish/view.dart';
import 'package:guxin_ai/pages/bbs/publish/view_article.dart';
import 'package:guxin_ai/pages/bbs/publish/view_special.dart';
import 'package:guxin_ai/pages/bbs_chat/controller.dart';
import 'package:guxin_ai/pages/bbs_chat/view.dart';
import 'package:guxin_ai/pages/settings/agreement/privacy.dart';
import 'package:guxin_ai/pages/settings/agreement/user.dart';
import 'package:guxin_ai/pages/bbs/controller.dart';
import 'package:guxin_ai/pages/bbs/view.dart';
import 'package:guxin_ai/pages/conversation/controller.dart';
import 'package:guxin_ai/pages/settings/about/index.dart';
import 'package:guxin_ai/pages/settings/account/index.dart';
import 'package:guxin_ai/pages/settings/account/logout.dart';
import 'package:guxin_ai/pages/settings/account/update_phone.dart';
import 'package:guxin_ai/pages/settings/backlist/index.dart';
import 'package:guxin_ai/pages/settings/controler.dart';
import 'package:guxin_ai/pages/settings/notification/index.dart';
import 'package:guxin_ai/pages/settings/password/reset.dart';
import 'package:guxin_ai/pages/settings/password/update.dart';
import 'package:guxin_ai/pages/settings/privacy/index.dart';
import 'package:guxin_ai/pages/settings/verify_code/index.dart';
import 'package:guxin_ai/pages/settings/view.dart';
import 'package:guxin_ai/pages/tools/controller.dart';
import 'package:guxin_ai/pages/tools/view.dart';
import 'package:guxin_ai/pages/conversation/chat/controller.dart';
import 'package:guxin_ai/pages/conversation/chat/view.dart';
import 'package:guxin_ai/pages/conversation/view.dart';
import 'package:guxin_ai/pages/home/bindings.dart';
import 'package:guxin_ai/pages/home/index.dart';
import 'package:guxin_ai/pages/home/index_pc.dart';
import 'package:guxin_ai/pages/settings/login/controller.dart';
import 'package:guxin_ai/pages/settings/login/login_view.dart';
import 'package:guxin_ai/pages/settings/login/login_vcode_view.dart';
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
      binding: BindingsBuilder(() => Get.put<PublishController>(PublishController())),
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
      page: () => const SettingsPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => SettingsController())),
    ),
    GetPage(
      name: Routes.settingsAccount,
      page: () => const SettingsAccountPage(),
    ),
    GetPage(
      name: Routes.settingsNotice,
      page: () => const SettingsNotificationPage(),
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
      page: () => const AccountUpdatePhonePage(),
    ),
    GetPage(
      name: Routes.settingsEnterVcode,
      page: () => const VerifyCodePage(),
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
      page: () => const PasswordReset(),
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
