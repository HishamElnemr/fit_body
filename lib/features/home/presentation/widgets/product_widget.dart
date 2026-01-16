import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: 250,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: const DecorationImage(
                  image: AssetImage(
                    Assets
                        .assetsImagesLivingRoomModernStyle3dScenesInteriorDesign145,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SvgPicture.asset(
                  Assets.assetsImagesFavorite,
                  color: Theme.of(context).colorScheme.primaryFixed,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SvgPicture.asset(
              Assets.assetsImagesTagIcon,
              color: AppColors.grey100,
            ),
            const SizedBox(width: 8),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              'Tag1 , Tag2 , Tag3',
              style: AppStyles.overlineRegular10(context),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          'Product Name',
          style: AppStyles.body2Medium14(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              '\$15',
              style: AppStyles.captionSemiBold12(context),
            ),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              '\$10',
              style: AppStyles.captionSemiBold12(context).copyWith(
                color: AppColors.grey100,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(Assets.assetsImagesRating),
            const SizedBox(width: 8),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              '4.5',
              style: AppStyles.captionRegular12(context),
            ),
          ],
        ),
      ],
    );
  }
}
