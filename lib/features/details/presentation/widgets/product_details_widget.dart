import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/quantity_selector.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_item_request.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_request_body.dart';
import 'package:fb_fitbody/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/product_call_to_action.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/product_tags_row.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/product_title_price_row.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/read_more_text.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/reviews_section.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key, required this.arguments});
  final ProductDetailsEntity arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.onSecondary.withValues(alpha: 0.12),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          ProductTagsRow(tags: arguments.tags),
          const SizedBox(height: 6),
          ProductTitlePriceRow(
            title: arguments.title,
            price: arguments.price,
            discountPercentage: arguments.discountPercentage,
          ),
          const SizedBox(height: 12),
          ReadMoreText(
            text:
                arguments.description +
                arguments.description +
                arguments.description +
                arguments.description +
                arguments.description +
                arguments.description +
                arguments.description +
                arguments.description,
          ),
          const SizedBox(height: 12),
          Text('Quantity', style: AppStyles.captionSemiBold12(context)),
          const SizedBox(height: 12),
          SizedBox(
            width: 120,
            child: QuantitySelector(stockQuantity: arguments.stock),
          ),
          const SizedBox(height: 12),
          ProductCallToAction(
            onPressed: () {
              context.read<CartCubit>().addToCart(
                CartRequestBody(
                  userId: 1,
                  products: [
                    CartItemRequest(
                      id: arguments.id,
                      quantity: arguments.stock,
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Text(
            'Reviews (${arguments.reviews.length})',
            style: AppStyles.body1SemiBold16(context),
          ),
          const SizedBox(height: 16),
          ReviewsSection(reviews: arguments.reviews),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
