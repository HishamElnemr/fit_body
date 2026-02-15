import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fb_fitbody/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:fb_fitbody/features/cart/presentation/widgets/cart_items_list.dart';
import 'package:fb_fitbody/features/cart/presentation/widgets/cart_order_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver: CartAppBar(),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(child: CartViewBodyBlocBuilder()),
        CartOrderInfo(),
      ],
    );
  }
}

class CartViewBodyBlocBuilder extends StatelessWidget {
  const CartViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartSuccess) {
          return CartItemsList(cartItems: state.cart.products);
        } else if (state is CartFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
