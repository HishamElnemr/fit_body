import 'package:dots_indicator/dots_indicator.dart';
import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({
    super.key,
    required this.dotsCount,
    required this.position,
  });
  final int dotsCount;
  final double position;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets
                        .assetsImagesLivingRoomModernStyle3dScenesInteriorDesign145,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.white.withOpacity(.5),
                    AppColors.black.withOpacity(.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '30% OFF',
                        style: AppStyles.button1SemiBold16(context).copyWith(
                          color: Theme.of(context).colorScheme.primaryFixed,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'On Headphones',
                      style: AppStyles.captionRegular12(context).copyWith(
                        color: Theme.of(context).colorScheme.primaryFixed,
                      ),
                    ),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      'Exclusive Sales',
                      style: AppStyles.heading2Bold24(context).copyWith(
                        color: Theme.of(context).colorScheme.primaryFixed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: DotsIndicator(
                      dotsCount: dotsCount,
                      position: position,
                      decorator: const DotsDecorator(
                        activeColor: AppColors.cyan,
                        color: AppColors.grey100,
                        activeSize: Size(8, 8),
                        spacing: EdgeInsets.symmetric(horizontal: 3),
                        size: Size(8, 8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
