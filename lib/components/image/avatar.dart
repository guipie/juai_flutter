import '../../base/base.dart';
import '../../constants/enums/widget_enum.dart';
import 'image.dart';

class JuAvatar extends StatelessWidget {
  const JuAvatar(this.path, {this.size = WSize.medium, this.onTap, super.key});
  final String? path;
  final WSize size;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var width = 36.0;
    var height = 36.0;
    if (size == WSize.small)
      width = height = 24;
    else if (size == WSize.large) width = height = 48;
    return JuImage(
      path,
      width: width,
      height: height,
      isTransform: false,
      onTap: onTap,
    );
  }
}
