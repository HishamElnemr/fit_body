import 'package:fb_fitbody/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fb_fitbody/features/cart/presentation/widgets/cart_items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBodyBlocBuilder extends StatelessWidget {
  const CartViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartSuccess) {
          if (state.cartItemEntity.isEmpty) {
            return SizedBox(
              height: height * 0.6,
              child: const Center(child: Text('Your Cart Is Empty')),
            );
          }
          return CartItemsList(cartItems: state.cartItemEntity);
        } else if (state is CartFailure) {
          return SizedBox(
            height: height * 0.6,

            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
