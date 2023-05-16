import 'package:flutter/material.dart';

class PublishSpecialPage extends StatelessWidget {
  const PublishSpecialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('写专栏'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: '专栏名称',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: '专栏描述',
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '专栏封面',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey.withOpacity(0.3),
                  child: Icon(
                    Icons.add_a_photo,
                    size: 50,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text('专栏是否付费'),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('发布专栏'),
            ),
          ],
        ),
      ),
    );
  }
}
