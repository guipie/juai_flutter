import 'package:guxin_ai/wcao/ui/theme.dart';
import 'package:flutter/material.dart';

class PublishWidgets {
  Widget huatiWidget(String? huati) {
    huati = huati ?? "#";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: WcaoTheme.placeholder.withOpacity(.25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        huati,
        style: TextStyle(color: WcaoTheme.secondary),
      ),
    );
  }
}
