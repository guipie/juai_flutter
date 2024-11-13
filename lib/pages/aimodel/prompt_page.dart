import 'package:easy_refresh/easy_refresh.dart';

import '../../base.dart';
import '../../components/card_pic.dart';
import '../../components/paging/paging_widget.dart';
import '../../components/riverpod_paging/paged_builder.dart';
import '../../module/prompt/prompt_viewmodel.dart';
import 'providers/prompt_provider.dart';

class PromptPage extends ConsumerStatefulWidget {
  const PromptPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PromptPageState();
}

class _PromptPageState extends ConsumerState<PromptPage> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JuAppBar.baseBar(text: '智能数字人'),
      body: PagingWidget(
        provider: promptNotifierProvider,
        futureRefreshable: promptNotifierProvider.future,
        notifierRefreshable: promptNotifierProvider.notifier,
        contentBuilder: (data, widgetCount, endItemView) {
          return EasyRefresh(
            onRefresh: () async => ref.refresh(promptNotifierProvider.future),
            child: SingleChildScrollView(
              controller: controller,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: data.items
                      .map((m) => CardPic(
                            m.avatar!.replaceAll('1', 'replace'),
                            m.title!,
                            titleCenter: true,
                          ))
                      .toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
