import 'package:cached_network_image/cached_network_image.dart';

import '../base.dart';
import 'skeleton.dart';

class JuImage extends StatelessWidget {
  const JuImage(
    this.path, {
    super.key,
    this.onTap,
    this.radius = 8,
    this.width = 200,
    this.height = 200,
  });
  final String? path;
  final double width;
  final double height;
  final double radius;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final hoverdTransform = Matrix4.identity()..scale(1.2);
    final unhoverdTransform = Matrix4.identity()..scale(1.0);
    final counter = ValueNotifier<int>(0);
    var isHovering = false;
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      onHover: (value) {
        isHovering = value;
        counter.value++;
      },
      child: ValueListenableBuilder(
        valueListenable: counter,
        builder: (context, value, child) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.ease,
              transform: isHovering ? hoverdTransform : unhoverdTransform,
              child: (path ?? Assets.imageAvatar).startsWith('http')
                  ? CachedNetworkImage(
                      width: width,
                      height: height,
                      fit: BoxFit.fill,
                      imageUrl: (path ?? Assets.imageAvatar),
                      progressIndicatorBuilder: (context, url, downloadProgress) => Skeletons.card(width: width, height: height),
                      errorWidget: (context, url, error) => Container(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                        width: width,
                        child: const Icon(Icons.error),
                      ),
                    )
                  : Image.asset(
                      (path.isEmpty() ? Assets.imageAvatar : path!),
                      width: width,
                    ),
            ),
          );
        },
      ),
    );
  }
}
