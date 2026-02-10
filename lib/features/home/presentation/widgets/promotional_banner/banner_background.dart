import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BannerBackground extends StatelessWidget {
  final int bannerIndex;
  final Widget child;

  const BannerBackground({
    super.key,
    required this.bannerIndex,
    required this.child,
  });

  List<Color> _getGradientColors(int index) {
    final gradients = [
      [AppColors.cyan, AppColors.blue],
      [AppColors.purple, AppColors.pink],
      [AppColors.orange, AppColors.merigold],
      [AppColors.red, AppColors.orange],
      [AppColors.blue, AppColors.purple],
    ];
    return gradients[index % gradients.length];
  }

  @override
  Widget build(BuildContext context) {
    final gradientColors = _getGradientColors(bannerIndex);

    return Container(
      height: 170,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradientColors[0], gradientColors[1]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(children: [_buildDecorativeCircles(), child]),
    );
  }

  Widget _buildDecorativeCircles() {
    return Stack(
      children: [
        Positioned(
          right: -20,
          top: -20,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
        ),
        Positioned(
          left: -30,
          bottom: -30,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),
        ),
      ],
    );
  }
}
