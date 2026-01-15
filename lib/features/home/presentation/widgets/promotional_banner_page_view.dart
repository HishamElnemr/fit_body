import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner.dart';
import 'package:flutter/material.dart';

class PromotionalBannerPageView extends StatefulWidget {
  const PromotionalBannerPageView({super.key});

  @override
  State<PromotionalBannerPageView> createState() =>
      _PromotionalBannerPageViewState();
}

class _PromotionalBannerPageViewState extends State<PromotionalBannerPageView> {
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
    return PageView(
      controller: _pageController,
      children: [
        PromotionalBanner(dotsCount: 3, position: _currentPage.toDouble()),
        PromotionalBanner(dotsCount: 3, position: _currentPage.toDouble()),
        PromotionalBanner(dotsCount: 3, position: _currentPage.toDouble()),
      ],
    );
  }
}
