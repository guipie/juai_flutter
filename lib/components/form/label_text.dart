import '../../base/base.dart';
import 'label_input.dart';

class LabelTextWidget extends StatefulWidget {
  const LabelTextWidget(
    this.label,
    this.val, {
    this.weakenLabel = false,
    this.leading,
    this.valExtend,
    this.isShowDefaultTrailing = true,
    super.key,
    this.onTap,
  });
  final String label;
  final bool weakenLabel;
  final String val;
  final Widget? valExtend;
  final Widget? leading;
  final bool isShowDefaultTrailing;
  final Function()? onTap;
  @override
  State<LabelTextWidget> createState() => _LabelTextWidgetState();
}

class _LabelTextWidgetState extends State<LabelTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          children: [
            4.width(),
            widget.leading ?? const SizedBox.shrink(),
            2.width(),
            Text(
              widget.label,
              style: widget.weakenLabel ? Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.6)) : Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.val,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            widget.valExtend ?? const SizedBox.shrink(),
            if (widget.isShowDefaultTrailing)
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Theme.of(context).textTheme.titleSmall?.color,
                size: 18,
              ),
            4.width(),
          ],
        ),
      ),
    );
  }
}
