import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

abstract class CategoriesGridStyles {
  static const EdgeInsets padding = EdgeInsets.all(kHorizontalPadding);

  static const SliverGridDelegateWithFixedCrossAxisCount delegate =
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        mainAxisExtent: 100,
      );
}
