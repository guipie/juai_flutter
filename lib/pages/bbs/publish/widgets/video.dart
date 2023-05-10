import 'package:flutter/material.dart';

class VideoEditWidget extends StatelessWidget {
  const VideoEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: '视频标题',
              border: InputBorder.none,
            ),
            maxLines: 1,
          ),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: '视频简介',
              border: InputBorder.none,
            ),
            maxLines: null,
          ),
        ),
        Expanded(
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  offset: Offset(0.0, 1.0),
                )
              ],
            ),
            child: Icon(Icons.add_to_drive_outlined),
          ),
        ),
      ],
    );
  }
}
