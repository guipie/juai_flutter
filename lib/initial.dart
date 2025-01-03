import 'services/db/db_base.dart';
import 'services/http/http.dart';
import 'utils/hive_box.dart';

import 'base.dart';

class Initial {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await HiveBox().init();
    await SpUtil.getInstance();
    MyDbProvider.getInstance();
    Http();
    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }
}
