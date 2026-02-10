import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CartOrderInfo extends StatelessWidget {
  const CartOrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: SizedBox()),
            Text('Order Info', style: AppStyles.heading2Bold24(context)),
            const SizedBox(height: 16),
            _OrderInfoRow(
              label: 'Subtotal',
              value: '100 \$',
              style: AppStyles.captionRegular12(context)
                  .copyWith(color: Theme.of(context).colorScheme.outline),
            ),
            const SizedBox(height: 12),
            _OrderInfoRow(
              label: 'Shipping Cost',
              value: '100 \$',
              style: AppStyles.captionRegular12(context)
                  .copyWith(color: Theme.of(context).colorScheme.outline),
            ),
            const SizedBox(height: 12),
            _OrderInfoRow(
              label: 'Total',
              value: '100 \$',
              style: AppStyles.body1Medium16(context),
              valueColor: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            CustomButton(text: 'Checkout', onPressed: () {}),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _OrderInfoRow extends StatelessWidget {
  const _OrderInfoRow({
    required this.label,
    required this.value,
    required this.style,
    this.valueColor,
  });

  final String label;
  final String value;
  final TextStyle style;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: style),
        const Spacer(),
        Text(
          value,
          style: valueColor != null ? style.copyWith(color: valueColor) : style,
        ),
      ],
    );
  }
}
