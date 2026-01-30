import 'package:fb_fitbody/core/services/getit_services.dart';
import 'package:fb_fitbody/features/search/domain/repositories/search_for_products_repo.dart';
import 'package:fb_fitbody/features/search/presentation/cubit/search_for_product_cubit.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/search_result_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final String query =
        ModalRoute.of(context)?.settings.arguments as String? ?? '';

    return BlocProvider(
      create: (context) =>
          SearchForProductCubit(getIt<SearchForProductsRepo>())
            ..searchForProducts(query: query),
      child: Scaffold(
        body: SafeArea(child: SearchResultViewBody(query: query)),
      ),
    );
  }
}
