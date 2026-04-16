import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/widgets/empty_state_action_section.dart';
import 'package:fb_fitbody/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fb_fitbody/features/cart/presentation/widgets/cart_items_list.dart';
import 'package:fb_fitbody/features/cart/presentation/widgets/cart_items_skeleton.dart';
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
            return SliverFillRemaining(
              hasScrollBody: false,
              child: EmptyStateActionSection(
                imagePath: Assets.assetsImages01OnlineShopping1,
                title: 'Your Cart is empty',
                description:
                    'Looks like you have not added anything in your cart. Go ahead and explore top categories.',
                buttonText: 'Explore Categories',
                onButtonPressed: () {
                  Navigator.pushNamed(context, RoutesName.categories);
                },
              ),
            );
          }
          return SliverToBoxAdapter(
            child: CartItemsList(cartItems: state.cartItemEntity),
          );
        } else if (state is CartFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(
              height: height * 0.6,
              child: Center(child: Text(state.errorMessage)),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 12),
              child: CartItemsSkeleton(),
            ),
          );
        }
      },
    );
  }
}
