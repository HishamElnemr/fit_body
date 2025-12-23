import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/widgets/custom_logo_widget.dart';
import 'package:fb_fitbody/features/onboarding/presentation/widgets/on_boarding_page_item.dart';
import 'package:fb_fitbody/features/onboarding/presentation/widgets/on_boarding_page_three_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required PageController pageController})
    : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        const OnBoardingPageItem(
          leading: CustomLogoWidget(),
          title: 'Explore a wide range of products',
          description:
              'Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.',
          image: Assets.assetsImages01OnlineShopping,
        ),
        OnBoardingPageItem(
          leading: GestureDetector(
            onTap: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: SvgPicture.asset(
              Assets.assetsImagesArrowLeft,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          title: 'Unlock exclusive offers and discounts',
          description:
              'Get access to limited-time deals and special promotions available only to our valued customers.',
          image: Assets.assetsImages02OnlineShopping,
        ),
        OnBoardingPageThreeItem(
          onPressed: () {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}
