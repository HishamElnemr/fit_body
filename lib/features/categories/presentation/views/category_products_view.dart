import 'package:fb_fitbody/core/services/getit_services.dart';
import 'package:fb_fitbody/features/categories/domain/repositories/categories_repo.dart';
import 'package:fb_fitbody/features/categories/presentation/cubits/get_products_by_category_cubit/get_products_by_categories_cubit.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/category_products_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final String category =
        ModalRoute.of(context)?.settings.arguments as String? ?? '';

    return BlocProvider(
      create: (context) =>
          GetProductsByCategoryCubit(categoriesRepo: getIt<CategoriesRepo>())
            ..getProductsByCategory(category: category),
      child: Scaffold(
        body: SafeArea(child: CategoryProductsViewBody(category: category)),
      ),
    );
  }
}
