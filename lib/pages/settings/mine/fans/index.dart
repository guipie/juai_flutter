import 'package:flutter/material.dart';
import 'package:juai/common/theme.dart';

class MineFans extends StatefulWidget {
  const MineFans({Key? key}) : super(key: key);

  @override
  State<MineFans> createState() => _MineFansState();
}

class _MineFansState extends State<MineFans> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('粉丝'),
      ),
      body: SafeArea(
        child: ListView(
          children: [2, 3, 4, 5].map((e) => listCard()).toList(),
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
          backgroundImage: NetworkImage(""),
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
                      "粉丝1",
                      style: TextStyle(
                        fontSize: WcaoTheme.fsXl,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        '21天 | 33动态',
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
                      color: false ? WcaoTheme.placeholder : WcaoTheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      false ? '已关注' : '关注',
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
