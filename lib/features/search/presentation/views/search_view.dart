import 'package:fb_fitbody/core/services/getit_services.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/widgets/custom_app_bar.dart';
import 'package:fb_fitbody/features/search/domain/repositories/search_for_products_repo.dart';
import 'package:fb_fitbody/features/search/presentation/cubit/search_for_product_cubit.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchForProductCubit(getIt<SearchForProductsRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(
          icon: Assets.assetsImagesCancel,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        body: const SafeArea(child: SearchViewBody()),
      ),
    );
  }
}
