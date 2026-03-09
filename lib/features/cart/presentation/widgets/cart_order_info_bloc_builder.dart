import 'package:fb_fitbody/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fb_fitbody/features/cart/presentation/widgets/cart_order_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartOrderInfoBlocBuilder extends StatelessWidget {
  const CartOrderInfoBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartSuccess) {
          return CartOrderInfo(subtotal: state.subtotal);
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
