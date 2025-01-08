import '../../base/base.dart';

class LabelInputMultiWidget extends StatefulWidget {
  const LabelInputMultiWidget(this.label, {this.hintText, super.key});
  final String label;
  final String? hintText;
  @override
  State<LabelInputMultiWidget> createState() => _LabelInputMultiWidgetState();
}

class _LabelInputMultiWidgetState extends State<LabelInputMultiWidget> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      constraints: const BoxConstraints(
        minHeight: 80.0, // 最小高度
        maxHeight: 160.0, // 最大高度
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null, // 允许扩展
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
                border: InputBorder.none,
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _controller.clear,
                      )
                    : null,
              ),
              keyboardType: TextInputType.multiline,
            ),
          ),
        ],
      ),
    );
  }
}
