import '../../base/base.dart';

class FilledBtnWidget extends StatelessWidget {
  const FilledBtnWidget(this.text, {this.onPressed, super.key, this.size = const Size(40, 40)});

  final VoidCallback? onPressed;
  final String text;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
        minimumSize: WidgetStateProperty.all(size),
      ),
      onPressed: () {
        onPressed?.call();
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
