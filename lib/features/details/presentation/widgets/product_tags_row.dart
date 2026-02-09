import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProductTagsRow extends StatelessWidget {
  final List<String> tags;

  const ProductTagsRow({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tags.length, (index) {
        return Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
            color: AppColors.cyan,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            tags[index],
            style: AppStyles.overlineSemiBold10(
              context,
            ).copyWith(color: AppColors.white),
          ),
        );
      }),
    );
  }
}
