import '../../base/base.dart';
import '../../base/version_check.dart';
import '../../const.dart';
import '../aimodel/view/aimodel_page.dart';
import '../chat/view/conversation_page.dart';
import '../setting/setting_page.dart';
import 'view_model/home_view_model.dart';
import 'widgets.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      VersionCheck().checkLastedVersion(context);
    });
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    var brightness = View.of(context).platformDispatcher.platformBrightness;

    if (SpUtil.getInt(spLightTheme, defValue: ThemeType.system.index) != ThemeType.system.index) {
      return;
    }

    if (brightness == Brightness.dark) {
      ref.read(themeProvider.notifier).change(ThemeType.system.index);
    } else {
      ref.read(themeProvider.notifier).change(ThemeType.system.index);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentIndex = ref.watch(homeVmProvider.select((value) => value.curTabIndex));
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: const [
          ConversationPage(),
          AiModelPage(),
          SettingPage(),
          SettingPage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: ref.watch(themeProvider).secondBgColor(),
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            children: [
              ...ref
                  .read(homeVmProvider)
                  .menus
                  .map((m) => Expanded(
                        child: BottomNavItem(
                          label: m.label,
                          index: m.index,
                          checked: currentIndex == m.index,
                          icon: m.icon,
                          iconChecked: m.checkedIcon,
                        ),
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
