import 'package:fluent_ui/fluent_ui.dart';

import 'base.dart';
import '../pages/home/view_model/home_view_model.dart';

abstract class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});
  Widget buildBody(BuildContext context, WidgetRef ref) {
    return const SizedBox.shrink();
  }

  abstract final String title;
  void initStateBase(WidgetRef ref) {}
  void disposeBase() {}
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BasePageState();
}

class _BasePageState extends ConsumerState<BasePage> {
  @override
  void initState() {
    super.initState();
    widget.initStateBase(ref);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 在这里放置你想要在页面初始化完成后执行的代码
      if (F.pc) ref.watch(homeVmProvider.notifier).setHomePcTitle(widget.title);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.disposeBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: F.pc ? null : JuAppBar.baseBar(text: widget.title),
      body: widget.buildBody(context, ref),
    );
  }
}
