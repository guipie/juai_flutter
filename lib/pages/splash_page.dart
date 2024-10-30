import 'package:chat_bot/pages/home/home_pc_page.dart';

import '../base.dart';
import 'home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (F.mobile) {
          F.pushReplacementNoAnimation(const HomePage());
        } else {
          F.pushReplacementNoAnimation(const HomePcPage());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
