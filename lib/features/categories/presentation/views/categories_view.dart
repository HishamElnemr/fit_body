import 'package:fb_fitbody/core/services/getit_services.dart';
import 'package:fb_fitbody/core/widgets/custom_back_title_app_bar.dart';
import 'package:fb_fitbody/features/categories/domain/repositories/categories_repo.dart';
import 'package:fb_fitbody/features/categories/presentation/cubits/get_categories_cubit/get_categories_cubit.dart';
import 'package:fb_fitbody/features/categories/presentation/cubits/get_products_by_category_cubit/get_products_by_categories_cubit.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/categories_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetCategoriesCubit(categoriesRepo: getIt<CategoriesRepo>())
                ..getCategories(),
        ),
        BlocProvider(
          create: (context) => GetProductsByCategoryCubit(
            categoriesRepo: getIt<CategoriesRepo>(),
          ),
        ),
      ],
      child: const Scaffold(
        appBar: CustomBackTitleAppBar(title: 'Categories'),
        body: SafeArea(child: CategoriesViewBody()),
      ),
    );
  }
}
