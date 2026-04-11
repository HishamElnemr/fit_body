import 'package:fb_fitbody/features/categories/presentation/widgets/category_label_formatter.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/category_products_app_bar.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/category_products_content.dart';
import 'package:flutter/material.dart';

class CategoryProductsViewBody extends StatelessWidget {
  const CategoryProductsViewBody({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CategoryProductsAppBar(categoryName: formatCategoryLabel(category)),
        CategoryProductsContent(category: category),
      ],
    );
  }
}
