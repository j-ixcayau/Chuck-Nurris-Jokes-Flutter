import 'package:flutter/material.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

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
        child: Image(
          width: width,
          height: height,
          image: PCacheImage(
            url!,
            enableInMemory: true,
          ),
          frameBuilder: (_, image, loadingBuilder, __) {
            if (loadingBuilder == null) {
              return const CircularProgressIndicator();
            }
            return image;
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }

            return const CircularProgressIndicator();
          },
          errorBuilder: (context, _, __) {
            return const Icon(Icons.error_outline);
          },
        ),
      ),
    );
  }
}
