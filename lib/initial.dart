import 'package:chat_bot/base/db/db_base.dart';
import 'package:chat_bot/utils/hive_box.dart';

import 'base.dart';

class Initial {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await HiveBox().init();
    await SpUtil.getInstance();
    MyDbProvider.getInstance();
    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }
}
