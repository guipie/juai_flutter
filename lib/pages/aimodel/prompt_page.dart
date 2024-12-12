import 'package:easy_refresh/easy_refresh.dart';

import '../../base.dart';
import '../../components/card_pic.dart';
import '../../components/mouse_hover_item.dart';
import '../../components/paging/paging_widget.dart';
import '../../components/riverpod_paging/paged_builder.dart';
import '../../components/td/tdesign_flutter.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../module/prompt/prompt_viewmodel.dart';
import 'prompt_add_page.dart';
import 'view_model/prompt_view_model.dart';
import 'widget/aimodel_widget.dart';

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
      appBar: JuAppBar.baseBar(
        text: S.current.digitalMan + S.current.home_square,
        actions: [
          AimodelWidget.buildAddDigitaMan(
            context,
            ref,
            onTap: () {
              F.push(const PromptAddPage());
            },
          ),
        ],
      ),
      body: PagingWidget(
        provider: promptVMProvider,
        futureRefreshable: promptVMProvider.future,
        notifierRefreshable: promptVMProvider.notifier,
        contentBuilder: (data, widgetCount, endItemView) {
          return Wrap(
            spacing: 12,
            runSpacing: 12,
            children: data.items
                .map(
                  (m) => SizedBox(
                    width: 300,
                    child: MouseHoverItem(
                      leadingPicUrl: m.avatar!,
                      title: m.title!,
                      subTitle: m.initMessage.isEmpty() ? '...' : m.initMessage,
                      isShowDefaultTrailing: false,
                      onTap: () {
                        debugPrint('点击了${m.title}');
                      },
                      footerWidget: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 12, top: 6, bottom: 4),
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
                            if (m.tags.isNotEmpty())
                              ...m.tags!
                                  .split(',')
                                  .map(
                                    (x) => TDTag(
                                      x,
                                      padding: const EdgeInsets.only(top: 6, left: 5, right: 5),
                                      isLight: true,
                                      theme: TDTagTheme.success,
                                      size: TDTagSize.small,
                                    ),
                                  )
                                  .toList(),
                            GestureDetector(
                              onTap: () {
                                F.pushChat(ref, ConversationEnum.promptChat, promptRes: m);
                              },
                              child: TDTag(
                                S.current.home_chat,
                                padding: const EdgeInsets.only(top: 6, left: 6, right: 6),
                                theme: TDTagTheme.success,
                                size: TDTagSize.small,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
