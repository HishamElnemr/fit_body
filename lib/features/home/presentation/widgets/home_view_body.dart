import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/categories_widget.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/latest_products_grid_view.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner_page_view.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/section_header.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          const SizedBox(height: 150, child: PromotionalBannerPageView()),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: SectionHeader(title: 'Categories', seeAll: 'See All'),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CategoriesWidget(),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: SectionHeader(title: 'Latest Products', seeAll: 'See All'),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: LatestProductsGridView(products: productEntity.products),
          ),
        ],
      ),
    );
  }
}
