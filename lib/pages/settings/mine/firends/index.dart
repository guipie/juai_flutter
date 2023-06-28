import 'package:flutter/material.dart';
import 'package:juai/common/theme.dart';

class MineFirends extends StatefulWidget {
  const MineFirends({Key? key}) : super(key: key);

  @override
  State<MineFirends> createState() => _MineFirendsState();
}

class _MineFirendsState extends State<MineFirends> {
  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('好友'),
      ),
      body: SafeArea(
        child: ListView(
          children: [4, 5, 7, 32, 23, 5].map((e) => listCard()).toList(),
        ),
      ),
    );
  }
}

Container listCard() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    margin: const EdgeInsets.only(top: 24),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage("aaa"),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "删除了",
                      style: TextStyle(
                        fontSize: WcaoTheme.fsXl,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        '22天 | 21动态',
                        style: TextStyle(
                          color: WcaoTheme.secondary,
                          fontSize: WcaoTheme.fsBase,
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: WcaoTheme.placeholder,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      '已关注',
                      style: TextStyle(fontSize: WcaoTheme.fsSm, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
