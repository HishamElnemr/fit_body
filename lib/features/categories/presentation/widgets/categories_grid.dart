import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/categories_constants.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/categories_grid_styles.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: CategoriesGridStyles.padding,
          sliver: SliverGrid.builder(
            itemCount: categories.length,
            gridDelegate: CategoriesGridStyles.delegate,
            itemBuilder: (context, index) {
              final String category = categories[index];
              final String? emoji = kEmojiByCategory[category];

              return CategoryGridItem(
                title: _formatCategoryLabel(category),
                emoji: emoji,
                icon: emoji == null
                    ? kIconsByCategory[category] ?? Icons.category_outlined
                    : null,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.categoryProducts,
                    arguments: category,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

String _formatCategoryLabel(String rawCategory) {
  return rawCategory
      .split('-')
      .map((word) {
        if (word.isEmpty) {
          return word;
        }
        return '${word[0].toUpperCase()}${word.substring(1)}';
      })
      .join(' ');
}
