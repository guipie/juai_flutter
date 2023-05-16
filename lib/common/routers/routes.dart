import 'package:get/get.dart';

class Routes {
  static const home = "/";
  static const homePc = "/pc";
  static const homeConversation = '/home_conversation';
  static const currentChat = '/chat';

  static const tools = "/tools";

  static const bbs = "/bbs";
  static const bbsPublishDongtai = "/bbs/publish/dongtai";
  static const bbsPublishArticle = "/bbs/publish/article";
  static const bbsPublishSpecial = "/bbs/publish/special";
  static const bbsTagAdd = "/bbs/publish/add/tag";

  static const bbsChat = "/bbs-chat";

  static const settings = "/settings";
  static const settingsAccount = "/settings/account";
  static const settingsUpdatePwd = "/settings/account/password/update";
  static const settingsUpdatePhone = "/settings/account/update-phone";
  static const settingsEnterVcode = "/settings/account/insert/vcode";
  static const settingsLogin = '/settings/account/sign_in';
  static const settingsLoginByVocde = '/settings/account/sign_in/vcode';
  static const settingsLoginout = "/settings/account/logout";
  static const settingsForgetPwd = "/settings/account/password/forget";

  static const settingsNotice = "/settings/notification";
  static const settingsPrivacy = "/settings/privacy";
  static const settingsBacklist = "/settings/backlist";
  static const settingsAbout = "/settings/about";
  static const settingsAgreementPrivacy = "/settings/agreement/privacy";
  static const settingsAgreementUser = "/settings/agreement/user";

  static const notFound = '/not_found';

  static const Application = '/application';
  static const Category = '/category';

  static void toHome() {
    if (GetPlatform.isMobile) {
      Get.offAndToNamed(home);
    } else {
      Get.toNamed(homePc);
    }
  }
}
