import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridSkeleton extends StatelessWidget {
  const ProductsGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CustomCachedNetworkImage(
                        imageUrl: '',
                        width: constraints.maxWidth,
                        height: constraints.maxWidth * 0.75,
                        borderRadius: 16,
                        fit: BoxFit.cover,
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
                      Flexible(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          'Tag1, Tag2',
                          style: AppStyles.overlineRegular10(context),
                        ),
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
                      Flexible(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          '\$100',
                          style: AppStyles.captionSemiBold12(context),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          '10 % OFF',
                          style: AppStyles.captionSemiBold12(
                            context,
                          ).copyWith(color: AppColors.grey100),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.assetsImagesRating),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          '4.5',
                          style: AppStyles.captionRegular12(context),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
