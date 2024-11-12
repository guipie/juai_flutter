import 'package:easy_refresh/easy_refresh.dart';

import '../../base.dart';
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
            child: ListView.builder(
              itemCount: widgetCount,
              itemBuilder: (context, index) {
                // if the index is last, then
                // return the end item view.
                if (index == widgetCount - 1) {
                  return endItemView;
                }
                // Otherwise, build a list tile for each sample item.
                return ListTile(
                  key: ValueKey(data.items[index].id),
                  title: Text(data.items[index].title ?? '123'),
                  leading: Text('$widgetCount'),
                  subtitle: Text(data.items[index].initMessage ?? ''),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
