import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:pull_down_button/pull_down_button.dart';

import '../../base/base.dart';
import '../../base/version_check.dart';
import '../../components/image/image.dart';
import '../../components/mouse_hover_item.dart';
import '../../const.dart';
import '../../utils/mydialog.dart';
import '../aimodel/view_model/prompt_view_model.dart';
import '../chat/view_model/chat_view_model.dart';
import '../login/provider/user_provider.dart';
import '../setting/setting_page.dart';
import '../square/square.dart';
import 'view_model/home_view_model.dart';

class HomePcPage extends ConsumerStatefulWidget {
  const HomePcPage({super.key});
  @override
  ConsumerState createState() => _HomePcPageState();
}

class _HomePcPageState extends ConsumerState<HomePcPage> with WidgetsBindingObserver {
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
    final itemsController = fl.FlyoutController();
    return fl.NavigationView(
      appBar: fl.NavigationAppBar(
        title: Row(
          children: [
            const Text('聚AI,一个就够了.'),
            Expanded(
              child: Center(
                child: Text(
                  ref.watch(homeVmProvider.select((value) => value.homePcTitle)),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            )
          ],
        ),
        leading: Center(
          child: JuImage(
            ref.read(curentUserProvider).avatar,
            width: 36,
            height: 36,
          ),
        ),
        actions: fl.FlyoutTarget(
          controller: itemsController,
          child: IconButton(
            icon: const fl.Icon(
              Icons.add,
              size: 24,
            ),
            onPressed: () {
              itemsController.showFlyout(
                  autoModeConfiguration: fl.FlyoutAutoConfiguration(
                    preferredMode: fl.FlyoutPlacementMode.bottomLeft,
                  ),
                  additionalOffset: 0,
                  // barrierDismissible: false,
                  dismissOnPointerMoveAway: true,
                  navigatorKey: GlobalKey<NavigatorState>().currentState,
                  builder: (context) {
                    return fl.MenuFlyout(
                      items: [
                        fl.MenuFlyoutItem(
                          text: Text(S.current.add + S.current.home_chat),
                          onPressed: () => F.pushChat(ref),
                        ),
                        const fl.MenuFlyoutSeparator(),
                        fl.MenuFlyoutItem(
                          text: Text(S.current.add + S.current.group_chat),
                          onPressed: () => ref.read(chatVmProvider.notifier).addGroupChat(),
                        ),
                        const fl.MenuFlyoutSeparator(),
                        fl.MenuFlyoutItem(
                          text: Text(S.current.add + S.current.digitalMan),
                          onPressed: () => ref.read(promptVMProvider.notifier).promptAdd(context),
                        ),
                        const fl.MenuFlyoutSeparator(),
                      ],
                    );
                  });
            },
          ),
        ),
      ),
      paneBodyBuilder: (item, body) {
        return AnimatedSwitcher(
          transitionBuilder: (child, animation) {
            return fl.DrillInPageTransition(animation: animation, child: child);
          },
          duration: const Duration(seconds: 2),
          child: IndexedStack(
            key: const ValueKey<int>(0),
            index: currentIndex,
            children: [...ref.read(homeVmProvider).menus.map((item) => item.page).toList()],
          ),
        );
      },
      pane: fl.NavigationPane(
        selected: currentIndex,
        size: const fl.NavigationPaneSize(openWidth: 120),
        onChanged: (index) => ref.read(homeVmProvider.notifier).setCurTabIndex(index),
        displayMode: fl.PaneDisplayMode.compact,
        items: [
          fl.PaneItemHeader(
            header: const Text(
              '111',
            ),
          ),
          ...ref
              .read(homeVmProvider)
              .menus
              .map((item) => fl.PaneItem(
                    icon: Icon(item.icon),
                    title: Text(item.label!),
                    body: item.page,
                  ))
              .toList()
        ],
        footerItems: [
          fl.PaneItemAction(
            icon: const Icon(Icons.share),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
