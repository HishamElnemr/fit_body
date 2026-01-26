import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/search_text_field.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/trending_widget.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const SearchTextField(),
          const SizedBox(height: 16),
          Text('TRENDING SEARCH', style: AppStyles.captionSemiBold12(context)),
          const SizedBox(height: 4),
          const TrendingWidget(),
          const TrendingWidget(),
          const TrendingWidget(),
          const TrendingWidget(),
        ],
      ),
    );
  }
}
