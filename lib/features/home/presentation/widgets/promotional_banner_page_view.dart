import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner/promotional_banner.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';

class PromotionalBannerPageView extends StatefulWidget {
  const PromotionalBannerPageView({
    super.key,
    required this.productDetailsEntity,
  });
  final List<ProductDetailsEntity> productDetailsEntity;
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
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.productDetailsEntity.length,
      itemBuilder: (context, index) {
        return PromotionalBanner(
          dotsCount: widget.productDetailsEntity.length,
          position: _currentPage.toDouble(),
          productDetailsEntity: widget.productDetailsEntity[index],
          bannerIndex: index,
        );
      },
    );
  }
}
