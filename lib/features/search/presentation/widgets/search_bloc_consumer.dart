import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/features/search/presentation/cubit/search_for_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBlocConsumer extends StatelessWidget {
  const SearchBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchForProductCubit, SearchForProductState>(
      listener: (context, state) {
        if (state is SearchForProductSuccess) {
          final query = context.read<SearchForProductCubit>().currentQuery;
          Navigator.pushNamed(
            context,
            RoutesName.searchResult,
            arguments: query,
          );
        } else if (state is SearchForProductFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is SearchForProductLoading) {
          return Container(
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(.3),
            child: const Center(
              child: CircularProgressIndicator(color: AppColors.cyan),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
