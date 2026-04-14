import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_cached_network_image.dart';
import 'package:fb_fitbody/features/product/data/models/hive_product_model.dart';
import 'package:fb_fitbody/features/product/presentation/cubit/hive_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({super.key, required this.hiveProductModel});

  final HiveProductModel hiveProductModel;

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
              border: Border.all(
                color: Theme.of(context).colorScheme.onTertiary,
              ),

              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CustomCachedNetworkImage(
                imageUrl: hiveProductModel.imageUrl,
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
                  hiveProductModel.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.body2Medium14(context),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${hiveProductModel.price.toStringAsFixed(2)}',
                  style: AppStyles.captionSemiBold12(context),
                ),
                const SizedBox(height: 2),
                Text(
                  '\$${hiveProductModel.oldPrice.toStringAsFixed(2)}',
                  style: AppStyles.overlineRegular10(context).copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.lightGrey150,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _QuantityControl(quantity: hiveProductModel.quantity),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<HiveCubit>().toggleProductInWishlist(
                          hiveProductModel.toEntity(),
                        );
                      },
                      child: SvgPicture.asset(
                        Assets.assetsImagesTrash,
                        colorFilter: const ColorFilter.mode(
                          AppColors.red,
                          BlendMode.srcIn,
                        ),
                        width: 24,
                        height: 24,
                      ),
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
