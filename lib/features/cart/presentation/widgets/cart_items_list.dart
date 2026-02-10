import 'package:fb_fitbody/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: CartItem(),
        );
      },
    );
  }
}
