import '../base/base.dart';

class TextSearchBox extends StatefulWidget {
  const TextSearchBox({super.key, this.onChanged, this.onSubmitted, this.hintText});
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? hintText;
  @override
  _TextSearchBoxState createState() => _TextSearchBoxState();
}

class _TextSearchBoxState extends State<TextSearchBox> {
  final TextEditingController _controller = TextEditingController();

  void _clearText() {
    setState(_controller.clear);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0, // 设置高度
      margin: const EdgeInsets.symmetric(horizontal: 16.0), // 左右各16px的外边距
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // 浅灰色背景
        borderRadius: BorderRadius.circular(20.0), // 边缘圆角
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 16.0), // 左侧内边距
          Icon(Icons.search, color: Colors.grey.shade500), // 搜索图标
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: '搜索', // 提示文字
                border: InputBorder.none, // 移除默认边框
                contentPadding: EdgeInsets.zero, // 内容区域无内边距
              ),
              style: TextStyle(fontSize: 16.0, color: Colors.grey.shade900), // 文本样式
            ),
          ),
          if (_controller.text.isNotEmpty)
            IconButton(
              icon: Icon(Icons.close, size: 18.0, color: Colors.grey.shade500), // 清除图标
              onPressed: _clearText,
            ),
          const SizedBox(width: 16.0), // 右侧内边距
        ],
      ),
    );
  }
}
