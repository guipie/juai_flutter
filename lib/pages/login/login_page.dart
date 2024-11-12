import '../../base.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: false,
        title: Text(
          '聚AI,一个就够了',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(statusBarIconBrightness: Brightness.light),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '扫码登录',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            // 扫码框
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: Stack(
                children: <Widget>[
                  const Center(
                    child: Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 50,
                    child: Container(
                      width: 150,
                      height: 2,
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 50,
                    child: Container(
                      width: 150,
                      height: 2,
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    left: 80,
                    top: 50,
                    child: Container(
                      width: 2,
                      height: 150,
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    left: 80,
                    top: 100,
                    child: Container(
                      width: 2,
                      height: 150,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '请对准二维码进行扫描',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                // TODO: 跳转到其它登录方式页面
              },
              child: const Text(
                '使用账号密码登录',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
