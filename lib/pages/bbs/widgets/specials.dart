import 'package:JuAI/common/config.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/entities/content/special.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialsWidget extends StatelessWidget {
  const SpecialsWidget(this.specials, {super.key, this.append});
  final List<SpecialResEntity> specials;
  final Widget? append;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      height: 86,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        children: [
          ...specials
              .map(
                (item) => InkWell(
                  onTap: () => Get.toNamed(Routes.bbsSpecial, arguments: item.id),
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    alignment: Alignment.bottomLeft,
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(QINIU_DOMAIN + item.coverImage),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(
                            item.title,
                            softWrap: false,
                            style: const TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.only(left: 4, right: 6),
                          decoration: BoxDecoration(
                            color: WcaoTheme.primary,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          if (append != null) append!,
        ],
      ),
    );
  }
}
