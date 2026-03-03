import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void showAddToCartSuccessSnackBar(BuildContext context) {
  _showCartSnackBar(
    context,
    _AddToCartSnackBarContent(
      onViewCartTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        Navigator.pushNamed(context, RoutesName.cart);
      },
    ),
  );
}

void showCartFailureSnackBar(BuildContext context, String message) {
  _showCartSnackBar(context, _FailureSnackBarContent(message: message));
}

void _showCartSnackBar(BuildContext context, Widget content) {
  final size = MediaQuery.sizeOf(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: size.height * 0.84, left: 16, right: 16),
      content: content,
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      duration: const Duration(seconds: 2),
    ),
  );
}

class _AddToCartSnackBarContent extends StatelessWidget {
  const _AddToCartSnackBarContent({required this.onViewCartTap});

  final VoidCallback onViewCartTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.cyan,
            borderRadius: BorderRadius.circular(4),
          ),
          child: SvgPicture.asset(Assets.assetsImagesTickCircle),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            'Product added to cart successfully !',
            style: AppStyles.captionRegular12(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
        TextButton(
          onPressed: onViewCartTap,
          child: Text(
            'View Cart',
            style: AppStyles.captionSemiBold12(
              context,
            ).copyWith(color: AppColors.cyan),
          ),
        ),
      ],
    );
  }
}

class _FailureSnackBarContent extends StatelessWidget {
  const _FailureSnackBarContent({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            message,
            style: AppStyles.captionRegular12(
              context,
            ).copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
