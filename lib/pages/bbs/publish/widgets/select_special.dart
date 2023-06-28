import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:juai/common/apis/content_special_api.dart';
import 'package:juai/entities/content/special.dart';
import 'package:juai/common/routers/routes.dart';
import 'package:juai/common/theme.dart';
import 'package:juai/common/widgets/image_cache.dart';

class SelectSpecialWidget extends StatefulWidget {
  const SelectSpecialWidget({super.key});
  @override
  State<SelectSpecialWidget> createState() => _SelectSpecialWidgetState();
}

class _SelectSpecialWidgetState extends State<SelectSpecialWidget> {
  List<SpecialResEntity> mySpecials = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      SpecialApi.getMine().then((value) => mySpecials = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: () async {
        Get.bottomSheet(
          Container(
            height: 1.sh / 2,
            color: Colors.white,
            child: ListView(
              children: mySpecials
                  .map(
                    (e) => ListTile(
                      tileColor: WcaoTheme.placeholder,
                      onTap: () => Get.offNamed(Routes.bbsPublishArticle, arguments: Map.from({"specialId": e.id, "specialName": e.title})),
                      title: Text(e.title),
                      subtitle: Text(e.summary.substring(0, e.summary.length > 50 ? 50 : e.summary.length) + "..."),
                      leading: SizedBox(
                        width: 80,
                        height: 80,
                        child: ImageCacheWidget(
                          e.coverImage,
                          width: 80,
                          height: 80,
                        ),
                      ),
                      focusColor: Colors.green,
                    ),
                  )
                  .toList(),
            ),
          ),
          //改变shape这里即可
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
        );
        setState(() {});
      },
      type: GFButtonType.transparent,
      icon: const Text("选择圈子"),
      child: const Icon(
        Icons.arrow_forward_outlined,
        size: 18,
      ),
    );
  }
}
