import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/categories_widget.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/product_widget.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner_page_view.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const SizedBox(height: 150, child: PromotionalBannerPageView()),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Categories', seeAll: 'See All'),
            const SizedBox(height: 12),
            const CategoriesWidget(),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Latest Products', seeAll: 'See All'),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return const ProductWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
