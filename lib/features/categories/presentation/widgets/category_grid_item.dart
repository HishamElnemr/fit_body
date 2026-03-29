import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.title,
    this.icon,
    this.emoji,
    this.onTap,
  }) : assert(icon != null || emoji != null);

  final String title;
  final IconData? icon;
  final String? emoji;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Color textColor = Theme.of(context).colorScheme.onSecondary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).colorScheme.onTertiary),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              emoji != null
                  ? Text(
                      emoji!,
                      style: AppStyles.heading1Bold32(
                        context,
                      ).copyWith(color: textColor),
                    )
                  : Icon(
                      icon ?? Icons.category_outlined,
                      size: 32,
                      color: textColor,
                    ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyles.captionSemiBold12(
                    context,
                  ).copyWith(color: textColor, height: 1, letterSpacing: 0.06),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
