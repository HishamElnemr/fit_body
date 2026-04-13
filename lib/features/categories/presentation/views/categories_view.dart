import 'package:fb_fitbody/core/services/getit_services.dart';
import 'package:fb_fitbody/core/widgets/page_title_app_bar.dart';
import 'package:fb_fitbody/features/categories/domain/repositories/categories_repo.dart';
import 'package:fb_fitbody/features/categories/presentation/cubits/get_categories_cubit/get_categories_cubit.dart';
import 'package:fb_fitbody/features/categories/presentation/widgets/categories_view_body_bloc_builder.dart';
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
      ],
      child: const Scaffold(
        appBar: PageTitleAppBar(title: 'Categories'),
        body: SafeArea(child: CategoriesViewBodyBlocBuilder()),
      ),
    );
  }
}
