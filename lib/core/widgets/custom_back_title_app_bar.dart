import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackTitleBarContent extends StatelessWidget {
  const BackTitleBarContent({
    super.key,
    required this.title,
    this.onBackTap,
    this.iconPath = Assets.assetsImagesArrowLeft,
  });

  final String title;
  final VoidCallback? onBackTap;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final Color foregroundColor = Theme.of(context).colorScheme.onSecondary;

    return Row(
      children: [
        GestureDetector(
          onTap: onBackTap ?? () => Navigator.maybePop(context),
          child: SizedBox(
            width: 32,
            height: 32,
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.body2Medium14(
              context,
            ).copyWith(color: foregroundColor),
          ),
        ),
      ],
    );
  }
}
