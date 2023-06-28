import 'package:juai/common/apis/content_tag_api.dart';
import 'package:flutter/material.dart';
import 'package:juai/common/store/content.dart';
import 'package:juai/common/widgets/tag.dart';
import 'package:juai/common/theme.dart';
import 'package:get/get.dart';

class BbsAddTag extends StatefulWidget {
  const BbsAddTag({Key? key}) : super(key: key);

  @override
  State<BbsAddTag> createState() => _BbsAddTagState();
}

class _BbsAddTagState extends State<BbsAddTag> {
  var searchController = TextEditingController();
  List<Map> tags = [];
  List<Map> myHistoryTags = [];
  List<Map> myCurrentTags = [];
  @override
  void initState() {
    super.initState();
    tags = ContentStore.to.topTags;
    searchController.addListener(() {
      setState(() {});
    });
    // ContentAPI.contentTagsMine().then((value) {
    //   setState(() {
    //     myHistoryTags = value;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('添加话题'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: myCurrentTags),
            child: Text(
              '确定',
              style: TextStyle(color: WcaoTheme.base),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              controller: searchController,
              hintText: "输入话题",
              elevation: MaterialStateProperty.all(0),
            ),
            if (searchController.text.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(10),
                color: WcaoTheme.primaryFocus,
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    if (myCurrentTags.isEmpty || myCurrentTags.any((element) => element["Name"] != searchController.text)) {
                      setState(() {
                        myCurrentTags.add({"Name": searchController.text});
                        ContentTagApi.contentTagAdd(searchController.text.trim());
                        searchController.text = "";
                      });
                    } else {
                      searchController.text = "";
                    }
                  },
                  child: Text("#${searchController.text}#"),
                ),
              ),
            Container(
              margin: const EdgeInsets.all(10),
              color: WcaoTheme.primaryFocus,
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 12,
                runSpacing: 12,
                children: myCurrentTags
                    .map(
                      (m) => TagWidget(
                        "#" + m["Name"] + "#",
                        backgroundColor: WcaoTheme.primary,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 6,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                color: WcaoTheme.primary.withOpacity(.25),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12,
                  runSpacing: 12,
                  children: tags
                      .map(
                        (m) => TagWidget(
                          "#" + m["Name"] + "#",
                          borderRadius: BorderRadius.circular(20),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 6,
                          ),
                          onTab: () {
                            setState(() {
                              debugPrint("回调${m["Name"]}");
                              myCurrentTags.addIf(myCurrentTags.isEmpty || myCurrentTags.any((element) => element["Name"] != m["Name"]), m);
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
