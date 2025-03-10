import '../../base/base.dart';
import '../../constants/enums/widget_enum.dart';
import 'image.dart';

class JuAvatar extends StatelessWidget {
  const JuAvatar(this.path, {this.text, this.size = WSize.medium, this.onTap, super.key});
  final String? path;
  final WSize size;
  final String? text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var width = 36.0;
    var height = 36.0;
    if (size == WSize.small)
      width = height = 24;
    else if (size == WSize.large) width = height = 48;
    var image = JuImage(
      path,
      width: width,
      height: height,
      isTransform: false,
      onTap: onTap,
    );
    if (text.isNotEmptyJu())
      return InkWell(
        onTap: onTap,
        child: Row(
          children: [
            image,
            8.width(),
            Text(
              text!,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      );
    return image;
  }
}
