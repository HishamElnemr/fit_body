import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/categories_widget.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner_page_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 24),
          SizedBox(height: 150, child: PromotionalBannerPageView()),
          SizedBox(height: 24),
          CategoriesWidget(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
