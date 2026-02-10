import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner/banner_background.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner/banner_content.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner/banner_dots.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';

class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({
    super.key,
    required this.dotsCount,
    required this.position,
    required this.productDetailsEntity,
    required this.bannerIndex,
  });

  final int dotsCount;
  final double position;
  final ProductDetailsEntity productDetailsEntity;
  final int bannerIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BannerBackground(
            bannerIndex: bannerIndex,
            child: BannerContent(product: productDetailsEntity),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: BannerDots(dotsCount: dotsCount, position: position),
            ),
          ),
        ],
      ),
    );
  }
}
