import 'package:flutter/cupertino.dart';

import '../base/base.dart';
import 'mouse_hover.dart';

class CardCustom extends ConsumerWidget {
  final String picUrl;
  final String title;
  final String? titleExtend;
  final String subTitle;

  const CardCustom({
    super.key,
    this.titleExtend,
    required this.picUrl,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Card(
      color: ref.watch(themeProvider).unPinedBgColor(),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: picUrl.startsWith('http')
                    ? Image.network(
                        picUrl,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        picUrl,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      if (titleExtend.isNotEmpty())
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            ' ($titleExtend)',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              CupertinoIcons.right_chevron,
              color: Theme.of(context).textTheme.titleSmall?.color,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
