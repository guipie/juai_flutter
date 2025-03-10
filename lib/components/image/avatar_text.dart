import '../../base/base.dart';
import '../../constants/enums/widget_enum.dart';
import 'image.dart';

class JuAvatarText extends StatelessWidget {
  const JuAvatarText(this.path, this.text, {this.size = WSize.medium, this.onTap, super.key});
  final String? path;
  final String text;
  final WSize size;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var width = 36.0;
    var height = 36.0;
    if (size == WSize.small)
      width = height = 24;
    else if (size == WSize.large) width = height = 48;
    return Row(
      children: [
        JuImage(
          path,
          width: width,
          height: height,
          isTransform: false,
          onTap: onTap,
        ),
        Text(text)
      ],
    );
  }
}
