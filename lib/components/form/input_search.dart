import '../../base/base.dart';

class InputSearchWidget extends StatefulWidget {
  const InputSearchWidget({super.key});

  @override
  _InputSearchWidgetState createState() => _InputSearchWidgetState();
}

class _InputSearchWidgetState extends State<InputSearchWidget> {
  // 控制器用来获取TextField的值
  final TextEditingController _controller = TextEditingController();

  void _onSearchPressed() {
    // 当按下搜索按钮时调用
    final query = _controller.text;
    if (query.isNotEmpty) {
      print('Searching for: $query');
      // 在这里添加你自己的搜索逻辑
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _onSearchPressed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
