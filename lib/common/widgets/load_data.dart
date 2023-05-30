import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'bottommost.dart';

class LoadDataWidget<T> extends StatelessWidget {
  const LoadDataWidget(this.future, {required this.chindFunc, super.key});
  final Future<T> future;
  final Function(T data) chindFunc;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            debugPrint('waiting');
            return const GFLoader(type: GFLoaderType.square);
          case ConnectionState.done:
            debugPrint('done');
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            debugPrint("snapshot.datasnapshot.datasnapshot.data${snapshot.data}");
            if (snapshot.data == null || (snapshot.data is Iterable && (snapshot.data as Iterable).isEmpty)) return const BottommostWidget(false, isNodata: true);
            return chindFunc(snapshot.data!);
          default:
            return const BottommostWidget(false, isNodata: true);
        }
      },
    );
  }
}
