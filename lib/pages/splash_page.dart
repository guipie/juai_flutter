import '../base/base.dart';
import 'home/home_page.dart';
import 'home/home_pc_page.dart';
import 'login/login_page.dart';
import 'login/provider/user_provider.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 500), () {
        ref.read(curentUserProvider.notifier).verifyLogin();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
