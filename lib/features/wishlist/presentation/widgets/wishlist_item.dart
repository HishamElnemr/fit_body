import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.quantity,
  });

  final String imageUrl;
  final String title;
  final double price;
  final double oldPrice;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.cyan50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomCachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.body2Medium14(context),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: AppStyles.captionSemiBold12(context),
                ),
                const SizedBox(height: 2),
                Text(
                  '\$${oldPrice.toStringAsFixed(2)}',
                  style: AppStyles.overlineRegular10(context).copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.lightGrey150,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _QuantityControl(quantity: quantity),
                    const Spacer(),
                    SvgPicture.asset(
                      Assets.assetsImagesTrash,
                      colorFilter: const ColorFilter.mode(
                        AppColors.red,
                        BlendMode.srcIn,
                      ),
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityControl extends StatelessWidget {
  const _QuantityControl({required this.quantity});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.lightGrey50),
      ),
      child: Row(
        children: [
          const _QuantityIcon(icon: Icons.remove),
          SizedBox(
            width: 32,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: AppStyles.body1Medium16(
                context,
              ).copyWith(color: AppColors.grey100),
            ),
          ),
          const _QuantityIcon(icon: Icons.add),
        ],
      ),
    );
  }
}

class _QuantityIcon extends StatelessWidget {
  const _QuantityIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Icon(icon, size: 18, color: AppColors.grey100),
    );
  }
}
