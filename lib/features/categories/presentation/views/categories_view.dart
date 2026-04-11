import 'package:fb_fitbody/core/services/getit_services.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_back_title_app_bar.dart';
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
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Navigator.canPop(context)
              ? const BackTitleBarContent(title: 'Categories')
              : Text('Categories', style: AppStyles.body2Medium14(context)),
        ),
        body: const SafeArea(child: CategoriesViewBodyBlocBuilder()),
      ),
    );
  }
}
