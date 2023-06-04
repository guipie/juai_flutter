import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:JuAI/common/assets.dart';
import 'package:JuAI/common/config.dart';

enum CacheImageType { network, local, asserts }

class ImageCacheWidget extends StatefulWidget {
  final String imageUrl;
  final CacheImageType cacheImageType;
  final double? width;
  final double? height;
  final bool? isBackground;
  const ImageCacheWidget(this.imageUrl, {super.key, this.cacheImageType = CacheImageType.network, this.width, this.height, this.isBackground});

  @override
  _ImageCacheWidgetState createState() => _ImageCacheWidgetState();
}

class _ImageCacheWidgetState extends State<ImageCacheWidget> {
  void _retryLoading() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("imageUrlimageUrlimageUrl：${widget.imageUrl},cacheImageTypecacheImageType：${widget.cacheImageType}");
    if (widget.cacheImageType == CacheImageType.asserts || widget.imageUrl.isEmpty) {
      return Image.asset(
        widget.imageUrl.isEmpty ? Assets.image404 : widget.imageUrl,
        fit: BoxFit.cover,
        width: widget.width,
        height: widget.height,
      );
    } else if (widget.cacheImageType == CacheImageType.network) {
      return CachedNetworkImage(
        imageUrl: (widget.imageUrl.startsWith("http") ? "" : Qiniu_External_domain) + widget.imageUrl,
        errorWidget: (context, url, error) => GestureDetector(
          onTap: _retryLoading,
          child: widget.isBackground == true
              ? Image.asset(Assets.imageBj)
              : const Icon(
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
    } else {
      return Image.file(
        File(widget.imageUrl),
        fit: BoxFit.cover,
        width: widget.width,
        height: widget.height,
      );
    }
  }
}

class SvgImageWidget extends StatelessWidget {
  const SvgImageWidget(
    this.url, {
    super.key,
    this.svgType = CacheImageType.asserts,
    this.width = 36,
    this.height = 36,
    this.color,
  });
  final CacheImageType svgType;
  final String url;
  final double width;
  final double height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      url,
      width: width,
      height: height,
      color: color,
    );
  }
}
