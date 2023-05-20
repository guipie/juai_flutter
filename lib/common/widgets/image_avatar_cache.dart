import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:guxin_ai/common/server.dart';

class ImageAvatarCacheWidget extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  const ImageAvatarCacheWidget(this.imageUrl, {super.key, this.width, this.height});

  @override
  _ImageAvatarCacheWidgetState createState() => _ImageAvatarCacheWidgetState();
}

class _ImageAvatarCacheWidgetState extends State<ImageAvatarCacheWidget> {
  void _retryLoading() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: (widget.imageUrl.startsWith("http") ? "" : Qiniu_External_domain) + widget.imageUrl,
      errorWidget: (context, url, error) => GestureDetector(
        onTap: _retryLoading,
        child: const Icon(
          Icons.image_not_supported_outlined,
          size: 60,
        ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 200),
      width: widget.width,
      height: widget.height,
      progressIndicatorBuilder: (context, url, downloadProgress) => LinearProgressIndicator(value: downloadProgress.progress),
    );
  }
}
