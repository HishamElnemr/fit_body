import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryDetailsBox extends StatelessWidget {
  const CategoryDetailsBox({
    super.key,
    required this.emoji,
    required this.title,
  });

  final String emoji;
  final String title;

  @override
  Widget build(BuildContext context) {
    final Color textColor = Theme.of(context).colorScheme.onSecondary;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          emoji,
          style: AppStyles.heading2Bold24(context).copyWith(color: textColor),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppStyles.overlineSemiBold10(
            context,
          ).copyWith(color: textColor, height: 1, letterSpacing: 0.15),
        ),
      ],
    );
  }
}
