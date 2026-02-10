import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_check_box.dart';
import 'package:fb_fitbody/core/widgets/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              Assets.assetsImagesLivingRoomModernStyle3dScenesInteriorDesign145,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          'Product Name Product Name',
                          style: AppStyles.body2Medium14(context),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CustomCheckBox(onTap: () {}, isSelected: true),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('100' + ' \$', style: AppStyles.heading3Bold18(context)),
                  Text(
                    '10%',
                    style: AppStyles.heading3Bold18(context)
                        .copyWith(color: Theme.of(context).colorScheme.outline)
                        .copyWith(decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const QuantitySelector(stockQuantity: 10),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.assetsImagesTrash),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
