import 'package:fb_fitbody/features/details/presentation/widgets/review_item.dart';
import 'package:fb_fitbody/features/product/domain/entities/reviews_entity.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.reviews});
  final List<ReviewsEntity> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ReviewItem(review: reviews[index]);
      },
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 1,
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.12),
        );
      },
      itemCount: reviews.length,
    );
  }
}
