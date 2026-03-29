import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/features/categories/presentation/cubit/get_categories_cubit/get_categories_cubit.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/categories_constants.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/categories_grid_styles.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/categories_view_skeleton.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesLoading) {
          return const CategoriesViewSkeleton();
        }

        if (state is GetCategoriesFailure) {
          return _CategoriesFailureState(errorMessage: state.errMessage);
        }

        if (state is GetCategoriesSuccess) {
          if (state.categories.isEmpty) {
            return const _CategoriesEmptyState();
          }

          return _CategoriesGrid(categories: state.categories);
        }

        return const CategoriesViewSkeleton();
      },
    );
  }
}

class _CategoriesGrid extends StatelessWidget {
  const _CategoriesGrid({required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: CategoriesGridStyles.padding,
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
              RoutesName.searchResult,
              arguments: category,
            );
          },
        );
      },
    );
  }
}

class _CategoriesFailureState extends StatelessWidget {
  const _CategoriesFailureState({required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(kHorizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                context.read<GetCategoriesCubit>().getCategories();
              },
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoriesEmptyState extends StatelessWidget {
  const _CategoriesEmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No categories found'));
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
