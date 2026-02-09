import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/features/product/domain/entities/reviews_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review});

  final ReviewsEntity review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              review.reviewerName,
              style: AppStyles.body1SemiBold16(context),
            ),
            Text(
              // format date
              review.date.substring(0, 10),
              style: AppStyles.captionRegular12(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.outline),
            ),
          ],
        ),
        const SizedBox(height: 8),
        RatingBarIndicator(
          rating: review.rating.toDouble(),
          itemBuilder: (context, index) =>
              const Icon(Icons.star, color: Colors.amber),
          itemCount: 5,
          itemSize: 16.0,
          direction: Axis.horizontal,
        ),
        const SizedBox(height: 8),
        Text(
          review.comment,
          style: AppStyles.body2Regular14(
            context,
          ).copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
