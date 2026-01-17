import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.iconPath, required this.name});

  final String iconPath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconPath, width: 24, height: 24),
          Text(name, style: AppStyles.captionSemiBold12(context)),
        ],
      ),
    );
  }
}

class InactiveIcon extends StatelessWidget {
  const InactiveIcon({super.key, required this.iconPath, required this.name});

  final String iconPath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconPath, width: 24, height: 24),
          Text(
            name,
            style: AppStyles.captionSemiBold12(
              context,
            ).copyWith(color: AppColors.lightGrey150),
          ),
        ],
      ),
    );
  }
}
