import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class BannerDots extends StatelessWidget {
  final int dotsCount;
  final double position;

  const BannerDots({
    super.key,
    required this.dotsCount,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: DotsIndicator(
        dotsCount: dotsCount,
        position: position,
        decorator: DotsDecorator(
          activeColor: Colors.white,
          color: Colors.white.withOpacity(0.4),
          activeSize: const Size(8, 8),
          spacing: const EdgeInsets.symmetric(horizontal: 3),
          size: const Size(6, 6),
        ),
      ),
    );
  }
}
