import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterOptionItem extends StatelessWidget {
  const FilterOptionItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(
                  isSelected
                      ? Assets.assetsImagesCheckBoxActive
                      : Assets.assetsImagesCheckBox,
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onSecondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(text, style: AppStyles.body2Medium14(context)),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: Theme.of(context).colorScheme.onTertiary,
          height: 1,
        ),
      ],
    );
  }
}
