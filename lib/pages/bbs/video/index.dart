import 'package:flutter/material.dart';

class VideoPlayPage extends StatefulWidget {
  @override
  _VideoPlayPageState createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: <Widget>[
            // 上滑部分
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(
                child: Text(
                  '上滑部分',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // 下滑部分
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Center(
                child: Text(
                  '下滑部分',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
