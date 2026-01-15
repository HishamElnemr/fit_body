import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryDetailsBox extends StatelessWidget {
  const CategoryDetailsBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          Assets.assetsImagesSearchNormal,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        const SizedBox(height: 8),
        Text('Electronics', style: AppStyles.overlineSemiBold10(context)),
      ],
    );
  }
}
