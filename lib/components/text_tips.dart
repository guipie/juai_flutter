import '../base.dart';

class TextTips extends StatelessWidget {
  const TextTips(this.text, {super.key, this.fontSize, this.padding});
  final String text;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: fontSize),
      ),
    );
  }
}
