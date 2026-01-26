import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
          child: SvgPicture.asset(
            Assets.assetsImagesSearchNormal,
            color: AppColors.darkGrey150,
            width: 25,
            height: 25,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.assetsImagesFilter,
              color: AppColors.darkGrey150,
              width: 25,
              height: 25,
            ),
          ),
        ),
        hintText: 'Search',
        hintStyle: AppStyles.captionRegular12(
          context,
        ).copyWith(color: AppColors.darkGrey150),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
