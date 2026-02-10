import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.onTap,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        isSelected
            ? Assets.assetsImagesCheckBoxActive
            : Assets.assetsImagesCheckBox,
        width: 32,
        height: 32,
        colorFilter: isSelected
            ? null
            : ColorFilter.mode(
                Theme.of(context).colorScheme.onSecondary,
                BlendMode.srcIn,
              ),
      ),
    );
  }
}
