import '../../base.dart';
import '../../base/version_check.dart';
import '../../const.dart';
import '../../module/prompt/prompt_page.dart';
import '../../module/services/services_page.dart';
import '../../module/setting/setting_page.dart';
import '../aimodel/aimodel_page.dart';
import '../chat/conversation_page.dart';
import 'home_provider.dart';
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
    var currentIndex = ref.watch(homeIndexProvider);

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: const [
          ConversationPage(),
          AiModelPage(),
          ServicesPage(),
          ServicesPage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: SizedBox(
          height: kBottomNavigationBarHeight + MediaQuery.paddingOf(context).bottom + kBottomNavigationBarHeight / 2,
          child: CustomPaint(
            painter: BottomNavPainter(
              bgColor: Theme.of(context).cardColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom, top: kBottomNavigationBarHeight / 2),
              child: Row(
                children: [
                  ...menus
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
                  // GestureDetector(
                  //   onTap: () {
                  //     if (!isExistModels()) {
                  //       showCommonDialog(
                  //         context,
                  //         title: S.current.reminder,
                  //         content: S.current.enter_setting_init_server,
                  //         hideCancelBtn: true,
                  //         autoPop: true,
                  //         confirmText: S.current.yes_know,
                  //         confirmCallback: () {},
                  //       );
                  //       return;
                  //     }
                  //     if (!isExistTTSAndWhisperModels()) {
                  //       showCommonDialog(
                  //         context,
                  //         title: S.current.reminder,
                  //         content: S.current.not_support_tts,
                  //         hideCancelBtn: true,
                  //         autoPop: true,
                  //         confirmText: S.current.yes_know,
                  //         confirmCallback: () {},
                  //       );
                  //       return;
                  //     }
                  //     F.push(const ChatAudioPage()).then((value) {
                  //       ChatItemProvider()
                  //           .deleteAll(specialGenerateAudioChatParentItemTime);
                  //     });
                  //   },
                  //   behavior: HitTestBehavior.opaque,
                  //   child: const LottieWidget(
                  //     scale: 2.4,
                  //     transformHitTests: false,
                  //     width: 80,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
