import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/widgets/products_grid_skeleton.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/categories_skeleton.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner/promotional_banner_skeleton.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewSkeleton extends StatelessWidget {
  const HomeViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Skeletonizer(
        enabled: true,
        child: Column(
          children: [
            SizedBox(height: 24),
            SizedBox(height: 150, child: PromotionalBannerSkeleton()),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: SectionHeader(title: 'Categories', seeAll: 'See All'),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: CategoriesSkeleton(),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: SectionHeader(title: 'Latest Products', seeAll: 'See All'),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: ProductsGridSkeleton(),
            ),
          ],
        ),
      ),
    );
  }
}
