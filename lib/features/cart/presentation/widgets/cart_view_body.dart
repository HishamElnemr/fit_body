import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:flutter/material.dart';

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
      ],
    );
  }
}
