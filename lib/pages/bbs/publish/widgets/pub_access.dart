import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:guxin_ai/entities/content/content.dart';

class PubAccessWidget extends StatefulWidget {
  const PubAccessWidget({super.key});

  @override
  State<PubAccessWidget> createState() => _PubAccessWidgetState();
}

class _PubAccessWidgetState extends State<PubAccessWidget> {
  String dropdownValue = BaReadType.Pub.name;
  @override
  Widget build(BuildContext context) {
    final values = [
      {"text": "公开访问", "value": BaReadType.Pub.name},
      {"text": "私有自己访问", "value": BaReadType.Pri.name},
      {"text": "付费", "value": BaReadType.Pay.name}
    ];
    return GFDropdown(
      borderRadius: BorderRadius.circular(5),
      border: const BorderSide(color: Colors.black12, width: 1),
      dropdownButtonColor: Colors.white,
      value: dropdownValue,
      onChanged: (newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: values
          .map((value) => DropdownMenuItem(
                value: value["value"],
                child: Text(value["text"].toString()),
              ))
          .toList(),
    );
  }
}
