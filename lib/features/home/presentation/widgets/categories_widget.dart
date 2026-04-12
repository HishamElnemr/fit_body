import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/category_box.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  static const List<_HomeCategoryItem> _categories = [
    _HomeCategoryItem(
      emoji: '📱',
      title: 'Electronics',
      categoryKey: 'smartphones',
    ),
    _HomeCategoryItem(
      emoji: '👜',
      title: 'Fashion',
      categoryKey: 'mens-shirts',
    ),
    _HomeCategoryItem(
      emoji: '🛋️',
      title: 'Furniture',
      categoryKey: 'furniture',
    ),
    _HomeCategoryItem(
      emoji: '🚗',
      title: 'Industrial',
      categoryKey: 'motorcycle',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(_categories.length * 2 - 1, (index) {
        if (index.isOdd) {
          return const SizedBox(width: 8);
        }

        final item = _categories[index ~/ 2];
        return Expanded(
          child: CategoryBox(
            emoji: item.emoji,
            title: item.title,
            onTap: () {
              Navigator.pushNamed(
                context,
                RoutesName.categoryProducts,
                arguments: item.categoryKey,
              );
            },
          ),
        );
      }),
    );
  }
}

class _HomeCategoryItem {
  const _HomeCategoryItem({
    required this.emoji,
    required this.title,
    required this.categoryKey,
  });

  final String emoji;
  final String title;
  final String categoryKey;
}
