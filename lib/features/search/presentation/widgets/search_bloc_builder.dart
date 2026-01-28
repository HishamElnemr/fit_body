import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/features/search/presentation/cubit/search_for_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchForProductCubit, SearchForProductState>(
      listener: (context, state) {
        if (state is SearchForProductSuccess) {
          Navigator.pushNamed(context, RoutesName.searchResult ,);
        } else if (state is SearchForProductFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: const SizedBox(),
    );
  }
}
