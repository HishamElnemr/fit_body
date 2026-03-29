import 'package:fb_fitbody/features/categories/presentation/widgets/categories_grid_styles.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesViewSkeleton extends StatelessWidget {
  const CategoriesViewSkeleton({super.key});

  static const int _itemsCount = 10;
  static const List<String> _placeholderEmojis = [
    '📱',
    '👜',
    '🛋️',
    '🚗',
    '🎁',
    '💄',
    '🏠',
    '📏',
    '🔌',
    '🍳',
  ];

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        padding: CategoriesGridStyles.padding,
        itemCount: _itemsCount,
        gridDelegate: CategoriesGridStyles.delegate,
        itemBuilder: (context, index) {
          final String emoji =
              _placeholderEmojis[index % _placeholderEmojis.length];

          return CategoryGridItem(title: 'Loading Category', emoji: emoji);
        },
      ),
    );
  }
}
