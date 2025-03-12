import '../../base/base.dart';

class LabelInputWidget extends StatefulWidget {
  const LabelInputWidget(this.label, {this.hintText, super.key});
  final String label;
  final String? hintText;
  @override
  State<LabelInputWidget> createState() => _LabelInputWidgetState();
}

class _LabelInputWidgetState extends State<LabelInputWidget> {
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
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          8.width(),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                filled: true,
                contentPadding: const EdgeInsets.only(left: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _controller.clear,
                        iconSize: 13,
                      )
                    : null,
              ),
              keyboardType: TextInputType.text,
            ),
          ),
        ],
      ),
    );
  }
}
