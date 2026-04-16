import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EmptyStateActionSection extends StatelessWidget {
  const EmptyStateActionSection({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonText,
    this.onButtonPressed,
  });

  final String imagePath;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 240,
              height: 240,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.heading2Bold24(
                context,
              ).copyWith(color: AppColors.black),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppStyles.body2Regular14(
                context,
              ).copyWith(color: AppColors.lightGrey150),
            ),
            const SizedBox(height: 24),
            CustomButton(text: buttonText, onPressed: onButtonPressed),
          ],
      ),
    );
  }
}
