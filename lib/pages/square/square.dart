import 'dart:math';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../base/base.dart';

class SquarePage extends ConsumerWidget {
  const SquarePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = List<Map<String, dynamic>>.generate(200, (index) => {'id': index, 'title': ' 新年快乐$index', 'height': Random().nextInt(150) + 50.5});
    return Scaffold(
      appBar: JuAppBar.baseBar(text: '广场'),
      body: MasonryGridView.count(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        // the number of columns
        crossAxisCount: 3,
        // vertical gap between two items
        mainAxisSpacing: 4,
        // horizontal gap between two items
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          // display each item with a card
          return Card(
            // Give each item a random background color
            color: Color.fromARGB(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
            key: ValueKey(items[index]['id']),
            child: SizedBox(
              height: items[index]['height'],
              child: Center(
                child: Text(items[index]['title']),
              ),
            ),
          );
        },
      ),
    );
  }
}
