import 'package:flutter/material.dart';
import 'package:guxin_ai/common/widgets/ui/tag.dart';
import 'package:guxin_ai/common/widgets/ui/theme.dart';
import 'package:dart_mock/dart_mock.dart' as mock;

import '../mock.dart';
import '../widgets/publish_card.dart';

// 社区
class BbsIndexPage extends StatefulWidget {
  const BbsIndexPage({Key? key}) : super(key: key);

  @override
  State<BbsIndexPage> createState() => _BbsIndexPageState();
}

class _BbsIndexPageState extends State<BbsIndexPage> {
  /// mockdata

  String searchText = mock.csentence(min: 3, max: 10);

  /// 热门话题
  List<Map> list = List.generate(mock.integer(min: 22, max: 32), (index) {
    return {"avatar": "", "tag": mock.cword(min: 2, max: 4)};
  });

  /// 热门标签
  List<String> labelData = List.generate(mock.integer(min: 4, max: 4), (index) => mock.cword(min: 4, max: 4));

  /// 发布的类容
  List<MockLike> items = [];

  @override
  void initState() {
    super.initState();
    MockLike.clear();
    setState(() {
      items = MockLike.get(num: 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 12, bottom: 24),
            color: Colors.white,
            child: Column(
              children: [
                search(),
                topic(),
                label(context),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: items.map((e) => PublishCard(e)).toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 12, bottom: 48, left: 48, right: 48),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  height: .5,
                  color: WcaoTheme.placeholder,
                )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('我是有底线的', style: TextStyle(color: WcaoTheme.placeholder)),
                ),
                Expanded(
                    child: Container(
                  height: .25,
                  color: WcaoTheme.placeholder,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container label(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Wrap(
        alignment: WrapAlignment.start,
        children: labelData
            .map((e) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    '#$e',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: WcaoTheme.fsL,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Container topic() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      height: 76,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        children: list
            .map(
              (item) => Container(
                margin: const EdgeInsets.only(right: 12),
                alignment: Alignment.bottomLeft,
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(item['avatar']),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Tag(
                      item['tag'],
                      color: Colors.white,
                      padding: const EdgeInsets.only(left: 4, right: 6),
                      backgroundColor: WcaoTheme.primary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Padding search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: WcaoTheme.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 36,
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: WcaoTheme.placeholder,
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              child: Text(
                searchText,
                style: TextStyle(
                  color: WcaoTheme.secondary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
