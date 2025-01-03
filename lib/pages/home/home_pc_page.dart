import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:pull_down_button/pull_down_button.dart';

import '../../base.dart';
import '../../base/version_check.dart';
import '../../components/image.dart';
import '../../components/mouse_hover_item.dart';
import '../../const.dart';
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
          actions: PullDownButton(
            scrollController: ScrollController(),
            menuOffset: 6,
            position: PullDownMenuPosition.automatic,
            buttonBuilder: (context, showMenu) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  showMenu();
                },
                child: IconButton(
                  icon: const Icon(Icons.add, size: 26),
                  onPressed: () {
                    showMenu();
                  },
                ),
              );
            },
            itemBuilder: (context) {
              return [
                {'key': 1, 'val': S.current.new_chat},
                {'key': 2, 'val': S.current.btn_add + S.current.digitalMan}
              ]
                  .map(
                    (m) => PullDownMenuItem(
                      title: m['val'].toString(),
                      onTap: () {
                        if (m['key'] == 1) {
                        } else if (m['key'] == 2) {}
                      },
                      icon: Icons.chat_bubble_outline,
                    ),
                  )
                  .toList();
            },
          )),
      pane: fl.NavigationPane(
        selected: currentIndex,
        size: const fl.NavigationPaneSize(openWidth: 120),
        onItemPressed: (index) {
          // Do anything you want to do, such as:
          // if (index == topIndex) {
          //   if (displayMode == PaneDisplayMode.open) {
          //     setState(() => this.displayMode = PaneDisplayMode.compact);
          //   } else if (displayMode == PaneDisplayMode.compact) {
          //     setState(() => this.displayMode = PaneDisplayMode.open);
          //   }
          // }
        },
        onChanged: (index) => ref.read(homeVmProvider.notifier).setCurTabIndex(index),
        displayMode: fl.PaneDisplayMode.compact,
        items: [
          fl.PaneItemHeader(
            header: const Text(
              'Inputs',
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
