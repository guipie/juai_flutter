import 'package:path_provider/path_provider.dart';

import '../f.dart';

class MyPathProvider {
  static Future<String> getPath() async {
    if (F.web)
      return '/path';
    else {
      var dir = await getApplicationDocumentsDirectory();
      return dir.path;
    }
  }
}
