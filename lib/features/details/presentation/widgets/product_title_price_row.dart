import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProductTitlePriceRow extends StatelessWidget {
  final String title;
  final double price;
  final double discountPercentage;

  const ProductTitlePriceRow({
    super.key,
    required this.title,
    required this.price,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.heading3Bold18(context)),
        Column(
          children: [
            Text(
              price.toString() + ' \$',
              style: AppStyles.heading3Bold18(context),
            ),
            Text(
              '${discountPercentage.round()}%',
              style: AppStyles.heading3Bold18(context)
                  .copyWith(color: Theme.of(context).colorScheme.outline)
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
          ],
        ),
      ],
    );
  }
}
