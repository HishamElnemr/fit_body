import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_cached_network_image.dart';
import 'package:fb_fitbody/core/widgets/custom_check_box.dart';
import 'package:fb_fitbody/core/widgets/quantity_selector.dart';
import 'package:fb_fitbody/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
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
            child: CustomCachedNetworkImage(
              imageUrl: cartItemEntity.thumbnail,
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
                          cartItemEntity.title,
                          style: AppStyles.body2Medium14(context),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CustomCheckBox(onTap: () {}, isSelected: true),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    cartItemEntity.price.toString() + ' \$',
                    style: AppStyles.heading3Bold18(context),
                  ),
                  Text(
                    cartItemEntity.discountPercentage.toString() + '%',
                    style: AppStyles.heading3Bold18(context)
                        .copyWith(color: Theme.of(context).colorScheme.outline)
                        .copyWith(decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuantitySelector(stockQuantity: cartItemEntity.quantity),
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
