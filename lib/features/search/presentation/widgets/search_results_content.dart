import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/products_grid_skeleton.dart';
import 'package:fb_fitbody/features/search/presentation/cubit/search_for_product_cubit.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/search_result_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsContent extends StatelessWidget {
  const SearchResultsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForProductCubit, SearchForProductState>(
      builder: (context, state) {
        if (state is SearchForProductLoading) {
          return const _LoadingState();
        } else if (state is SearchForProductSuccess) {
          return SearchResultGridView(products: state.productEntity.products);
        } else if (state is SearchForProductFailure) {
          return _ErrorState(errorMessage: state.errorMessage);
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(child: ProductsGridSkeleton());
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Error: $errorMessage',
          style: AppStyles.body2Medium14(context).copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
