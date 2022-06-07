import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LoadNetworkImage extends StatelessWidget {
  const LoadNetworkImage(
    this.url, {
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final String? url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return SizedBox(
        width: width,
        height: height,
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: CachedNetworkImage(
          imageUrl: url!,
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return CircularProgressIndicator(value: downloadProgress.progress);
          },
          errorWidget: (context, url, error) {
            return const Icon(Icons.error_outline);
          },
        ),
      ),
    );
  }
}
