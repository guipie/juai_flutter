import 'package:get/get.dart';
import 'package:juai_flutter/app/global_widgets/dialogs/common_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUtil {
  /// 拨打电话
  static Future callPhone(String? number) async {
    return Get.dialog(
      AlertContentView(
        title: '拨打电话: $number',
        content: '',
        onRight: () async {
          final Uri launchUri = Uri(
            scheme: 'tel',
            path: number,
          );
          if (await canLaunchUrl(launchUri)) {
            await launchUrl(launchUri);
          }
        },
      ),
      useSafeArea: false,
    );
  }

  /// 打开网页
  static Future openUrl(String url, {LaunchMode model = LaunchMode.externalApplication}) async {
    try {
      Uri launchUri;
      var path = url;
      if (url.endsWith('/')) {
        path = url.substring(0, url.length - 1);
      }
      final splitList = path.split('://');

      // if (isFile) {

      launchUri = Uri.parse('${splitList.first == 'https' ? 'https' : 'http'}://${splitList.last}');
      // launchUri = Uri(
      //   scheme: splitList.first == 'https' ? 'https' : 'http',
      //   host: '',
      //   path: splitList.last,
      // );
      // } else {
      //   if (splitList.first == 'https') {
      //     launchUri = Uri.https(
      //       splitList.last,
      //     );
      //   } else {
      //     launchUri = Uri.http(
      //       splitList.last,
      //     );
      //   }
      // }

      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri, mode: model);
      }
    } catch (e) {
      // print(e);
    }
  }

  /// 高德地图
  static Future gotoAMap(longitude, latitude) async {
    var url = '${GetPlatform.isAndroid ? 'android' : 'ios'}amap://navi?sourceApplication=支付公园&lat=$latitude&lon=$longitude&dev=0&style=2';
    final Uri launchUri = Uri.parse(url);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {}
  }

  /// 腾讯地图
  static Future gotoTencentMap(longitude, latitude) async {
    var url = 'qqmap://map/routeplan?type=drive&fromcoord=CurrentLocation&tocoord=$latitude,$longitude&referer=IXHBZ-QIZE4-ZQ6UP-DJYEO-HC2K2-EZBXJ';
    final Uri launchUri = Uri.parse(url);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {}
  }

  /// 百度地图
  static Future gotoBaiduMap(longitude, latitude) async {
    var url = 'baidumap://map/direction?destination=$latitude,$longitude&coord_type=bd09ll&mode=driving';
    final Uri launchUri = Uri.parse(url);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {}
  }

  /// 发送邮件
  static Future email(String? address) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: address,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
}
