import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/features/product/domain/entities/dimensions_entity.dart';
import 'package:fb_fitbody/features/product/domain/entities/meta_entity.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PromotionalBannerSkeleton extends StatelessWidget {
  const PromotionalBannerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    // Create dummy data for skeleton
    final dummyProduct = ProductDetailsEntity(
      id: 0,
      title: 'Loading Product Name Here',
      description: 'Loading description',
      category: 'Loading',
      price: 99.99,
      discountPercentage: 25.0,
      rating: 4.5,
      stock: 10,
      tags: ['Tag1', 'Tag2'],
      brand: 'Brand',
      sku: 'SKU',
      weight: 1,
      warrantyInformation: 'Warranty',
      shippingInformation: 'Shipping',
      availabilityStatus: 'Available',
      returnPolicy: 'Return',
      minimumOrderQuantity: 1,
      thumbnail: 'https://via.placeholder.com/400x150',
      images: ['https://via.placeholder.com/400x150'],
      reviews: [],
      dimensions: const DimensionsEntity(width: 0, height: 0, depth: 0),
      meta: MetaEntity(
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
        barcode: '',
        qrCode: '',
      ),
    );

    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(dummyProduct.images[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(
                          context,
                        ).colorScheme.primaryFixed.withOpacity(.5),
                        Theme.of(
                          context,
                        ).colorScheme.onSecondary.withOpacity(.5),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),

                          child: Text(
                            'Loading Discount',
                            style: AppStyles.button1SemiBold16(context)
                                .copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primaryFixed,
                                ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          'Loading Product Name Here',
                          style: AppStyles.captionRegular12(context).copyWith(
                            color: Theme.of(context).colorScheme.primaryFixed,
                          ),
                        ),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          'Exclusive Sales',
                          style: AppStyles.heading2Bold24(context).copyWith(
                            color: Theme.of(context).colorScheme.primaryFixed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
