import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenuRow extends StatelessWidget {
  const ProfileMenuRow({
    super.key,
    required this.title,
    required this.iconPath,
    this.trailing,
    this.onTap,
    this.isDestructive = false,
    this.showTrailingArrow = true,
  });

  final String title;
  final String iconPath;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isDestructive;
  final bool showTrailingArrow;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color contentColor = isDestructive
        ? AppColors.red
        : colorScheme.outline;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: 14,
          ),
          child: Row(
            children: [
              _ProfileLeadingIcon(iconPath: iconPath, iconColor: contentColor),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: AppStyles.body2Medium14(
                    context,
                  ).copyWith(color: contentColor),
                ),
              ),
              if (trailing != null)
                trailing!
              else if (showTrailingArrow)
                _TrailingArrowIcon(color: contentColor),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileLeadingIcon extends StatelessWidget {
  const _ProfileLeadingIcon({required this.iconPath, required this.iconColor});

  final String iconPath;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final lowerCasePath = iconPath.toLowerCase();

    if (lowerCasePath.endsWith('.svg')) {
      return SvgPicture.asset(
        iconPath,
        width: 22,
        height: 22,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      );
    }

    return Image.asset(
      iconPath,
      width: 22,
      height: 22,
      color: iconColor,
      errorBuilder: (_, __, ___) =>
          Icon(Icons.circle, size: 8, color: iconColor),
    );
  }
}

class _TrailingArrowIcon extends StatelessWidget {
  const _TrailingArrowIcon({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.assetsImagesArrowRight,
      width: 20,
      height: 20,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
