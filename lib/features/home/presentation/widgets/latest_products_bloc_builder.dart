import 'package:fb_fitbody/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/latest_products_grid_view.dart';
import 'package:fb_fitbody/core/widgets/products_grid_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestProductsBlocBuilder extends StatelessWidget {
  const LatestProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return const ProductsGridSkeleton();
        }
        if (state is GetProductsSuccess) {
          return LatestProductsGridView(products: state.productEntity.products);
        }
        if (state is GetProductsFailure) {
          return Center(child: Text(state.errMessage));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
