import 'package:fb_fitbody/features/categories/presentation/cubits/get_categories_cubit/get_categories_cubit.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/categories_empty_state.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/categories_failure_state.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/categories_grid.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/categories_view_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesViewBodyBlocBuilder extends StatelessWidget {
  const CategoriesViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesLoading) {
          return const CategoriesViewSkeleton();
        }

        if (state is GetCategoriesFailure) {
          return CategoriesFailureState(errorMessage: state.errMessage);
        }

        if (state is GetCategoriesSuccess) {
          if (state.categories.isEmpty) {
            return const CategoriesEmptyState();
          }

          return CategoriesGrid(categories: state.categories);
        }

        return const CategoriesViewSkeleton();
      },
    );
  }
}
