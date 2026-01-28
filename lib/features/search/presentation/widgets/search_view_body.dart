import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/features/search/presentation/cubit/search_for_product_cubit.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/search_text_field.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/trending_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  static const List<String> trendingList = [
    'Laptop',
    'Shoes',
    'Headphones',
    'Watch',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchForProductCubit, SearchForProductState>(
      listener: (context, state) {
        if (state is SearchForProductSuccess) {
          Navigator.pushNamed(context, RoutesName.searchResult);
        } else if (state is SearchForProductFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const SearchTextField(),
            const SizedBox(height: 16),
            Text(
              'TRENDING SEARCH',
              style: AppStyles.captionSemiBold12(context),
            ),
            const SizedBox(height: 4),
            ...trendingList.map((e) => TrendingWidget(text: e)),
          ],
        ),
      ),
    );
  }
}
