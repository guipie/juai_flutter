import 'package:cached_network_image/cached_network_image.dart';

import '../base.dart';

class JuImage extends StatelessWidget {
  const JuImage(this.path, {super.key, this.width = 200});
  final String path;
  final double width;
  @override
  Widget build(BuildContext context) {
    return path.startsWith('http')
        ? CachedNetworkImage(
            width: 200,
            fit: BoxFit.fill,
            scale: 0.8,
            imageUrl: path,
            progressIndicatorBuilder: (context, url, downloadProgress) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Container(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              width: 200,
              height: 200,
              child: const Icon(Icons.error),
            ),
          )
        : Image.asset(path);
  }
}
