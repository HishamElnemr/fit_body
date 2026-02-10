import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';

class BannerContent extends StatelessWidget {
  final ProductDetailsEntity product;

  const BannerContent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: _buildTextContent(context)),
          Expanded(flex: 2, child: _buildImageContainer()),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDiscountBadge(context),
        const SizedBox(height: 8),
        _buildProductTitle(context),
        const SizedBox(height: 2),
        _buildExclusiveSalesText(context),
      ],
    );
  }

  Widget _buildDiscountBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        '${product.discountPercentage.round()}% OFF',
        style: AppStyles.button1SemiBold16(
          context,
        ).copyWith(color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildProductTitle(BuildContext context) {
    return Text(
      product.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppStyles.captionRegular12(
        context,
      ).copyWith(color: Colors.white.withValues(alpha: 0.9), fontSize: 11),
    );
  }

  Widget _buildExclusiveSalesText(BuildContext context) {
    return Text(
      'Exclusive\nSales',
      style: AppStyles.heading2Bold24(
        context,
      ).copyWith(color: Colors.white, height: 1.1, fontSize: 22),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        // child: CustomCachedNetworkImage(
        //   imageUrl: product.images[0],
        //   fit: BoxFit.contain,
        // ),
        child: CachedNetworkImage(
          imageUrl: product.images[0],
          fit: BoxFit.contain,
          placeholder: (context, url) =>
              Container(color: Colors.white.withValues(alpha: 0.1)),
          errorWidget: (context, url, error) => Icon(
            Icons.image_not_supported_outlined,
            color: Colors.white.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }
}
