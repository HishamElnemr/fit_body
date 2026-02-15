import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/widgets/custom_filled_button.dart';
import 'package:fb_fitbody/core/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCallToAction extends StatelessWidget {
  const ProductCallToAction({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomOutlinedButton(text: 'Buy Now', onPressed: () {}),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomFilledButton(
            onPressed: onPressed,
            text: 'Add to Cart',
            icon: SvgPicture.asset(
              Assets.assetsImagesShoppingCartInactive,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
