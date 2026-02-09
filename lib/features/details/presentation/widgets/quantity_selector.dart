import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key, required this.stockQuantity});
  final int stockQuantity;
  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text('Quantity', style: AppStyles.captionSemiBold12(context)),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (quantity > 1) {
                    quantity--;
                  }
                });
              },
              icon: const Icon(Icons.remove),
            ),
            Text(quantity.toString()),
            IconButton(
              onPressed: () {
                setState(() {
                  if (quantity < widget.stockQuantity) {
                    quantity++;
                  }
                });
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
