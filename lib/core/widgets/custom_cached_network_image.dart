import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => Container(
          width: width,
          height: height,
          color: Colors.grey[200],
          child: Skeletonizer(
            enabled: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                Assets.assetsImages01OnlineShopping,
                width: width,
                height: height,
                fit: fit,
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          color: Colors.grey[200],
          child: const Skeletonizer(enabled: true, child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
