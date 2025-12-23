import 'package:dots_indicator/dots_indicator.dart';
import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/features/onboarding/presentation/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        OnBoardingPageView(pageController: _pageController),
        Positioned(
          bottom: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: DotsIndicator(
                dotsCount: 3,
                position: _currentPage.toDouble(),
                decorator: const DotsDecorator(
                  activeColor: AppColors.cyan,
                  color: AppColors.grey100,
                  activeSize: Size(12, 12),
                  size: Size(12, 12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
