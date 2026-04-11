import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/products_grid_skeleton.dart';
import 'package:fb_fitbody/features/categories/presentation/cubits/get_products_by_category_cubit/get_products_by_categories_cubit.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/category_products_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsContent extends StatelessWidget {
  const CategoryProductsContent({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsByCategoryCubit, GetProductsByCategoryState>(
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return const SliverToBoxAdapter(child: ProductsGridSkeleton());
        }

        if (state is GetProductsFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errMessage,
                    textAlign: TextAlign.center,
                    style: AppStyles.body2Medium14(context),
                  ),
                  
                ],
              ),
            ),
          );
        }

        if (state is GetProductsSuccess) {
          if (state.productEntity.products.isEmpty) {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  'No products found',
                  style: AppStyles.body1Medium16(context),
                ),
              ),
            );
          }

          return CategoryProductsGrid(products: state.productEntity.products);
        }

        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
