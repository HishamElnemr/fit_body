import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/categories_widget.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/latest_products_bloc_builder.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner_bloc_builder.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          SizedBox(height: 150, child: PromotionalBannerBlocBuilder()),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: SectionHeader(title: 'Categories', seeAll: 'See All'),
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CategoriesWidget(),
          ),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: SectionHeader(title: 'Latest Products', seeAll: 'See All'),
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: LatestProductsBlocBuilder(),
          )
          
        ],
      ),
    );
  }
}
