import 'package:JuAI/common/utils/http.dart';

class StatisticsApi {
  static Future<Map<String, dynamic>> homeStatistics() async {
    var response = await HttpUtil().get('/Statistics/home');
    return response.data;
  }
}
