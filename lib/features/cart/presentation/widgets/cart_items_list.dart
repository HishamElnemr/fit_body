import 'package:fb_fitbody/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fb_fitbody/features/cart/presentation/cubit/cart_counter_cubit/cart_counter_cubit.dart';
import 'package:fb_fitbody/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      itemCount: cartItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return BlocProvider(
          create: (context) => CartCounterCubit(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CartItem(cartItemEntity: cartItems[index]),
          ),
        );
      },
    );
  }
}
