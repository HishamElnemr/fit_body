import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/categories_widget.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/latest_products_bloc_builder.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner_bloc_builder.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          const SizedBox(height: 170, child: PromotionalBannerBlocBuilder()),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: SectionHeader(
              title: 'Categories',
              seeAll: 'See All',
              onSeeAllTap: () {
                Navigator.pushNamed(context, RoutesName.categories);
              },
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CategoriesWidget(),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: SectionHeader(
              title: 'Latest Products',
              seeAll: 'See All',
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: LatestProductsBlocBuilder(),
          ),
        ],
      ),
    );
  }
}
