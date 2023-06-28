import 'package:juai/entities/content/content.dart';
import 'package:share_plus/share_plus.dart';

class MyShare {
  static const _shareSlogen = " -聚AI,所有ai爱好者的聚集地(juai.link)";
  static void shareContentDetail(ContentResEntity content) {
    Share.share(content.summary + _shareSlogen, subject: _shareSlogen);
  }
}
