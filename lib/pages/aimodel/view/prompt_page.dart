import 'package:fluent_ui/fluent_ui.dart' as fl;

import '../../../base/base.dart';
import '../../../base/base_page.dart';
import '../../../components/mouse_hover_item.dart';
import '../../../components/paging/paging_widget.dart';
import '../../../constants/enums/conversation_enum.dart';
import '../view_model/prompt_view_model.dart';

class PromptPage extends BasePage {
  const PromptPage({super.key});
  @override
  String get title => S.current.digitalMan + S.current.home_square;
  @override
  fl.Widget buildBody(fl.BuildContext context, WidgetRef ref) {
    return PagingWidget(
      provider: promptVMProvider,
      futureRefreshable: promptVMProvider.future,
      notifierRefreshable: promptVMProvider.notifier,
      padding: const fl.EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      contentBuilder: (data, widgetCount, endItemView) {
        return Wrap(
          runSpacing: 12,
          spacing: 10,
          children: data.items
              .map(
                (m) => SizedBox(
                  width: 300.wf,
                  child: MouseHoverItem(
                    isRadius: true,
                    leadingPicUrl: m.avatar!,
                    title: m.title,
                    subTitle: m.initMessage.isEmptyJu() ? '...' : m.initMessage,
                    isShowDefaultTrailing: false,
                    onTap: () {
                      debugPrint('点击了${m.title}');
                    },
                    footerWidget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 12,
                        runSpacing: 6,
                        children: [
                          Text(
                            '@${m.type}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Icon(
                            Icons.favorite_border_outlined,
                            size: Theme.of(context).textTheme.bodySmall!.fontSize,
                            color: Theme.of(context).textTheme.bodySmall!.color,
                          ),
                          if (m.tags.isNotEmptyJu())
                            ...m.tags!
                                .split(',')
                                .map(
                                  (x) => fl.Button(
                                    style: const fl.ButtonStyle(
                                      padding: fl.WidgetStatePropertyAll(fl.EdgeInsets.symmetric(horizontal: 4)),
                                    ),
                                    onPressed: null,
                                    child: Text(x),
                                  ),
                                )
                                .toList(),
                          FilledButton(
                            //按钮设置变小
                            style: const ButtonStyle(
                              minimumSize: fl.WidgetStatePropertyAll(Size(56, 32)),
                              padding: fl.WidgetStatePropertyAll(fl.EdgeInsets.zero),
                            ),
                            child: Text(S.current.home_chat),
                            onPressed: () => F.pushChat(ref, promptRes: m),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
