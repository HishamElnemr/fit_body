import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/widgets/empty_state_action_section.dart';
import 'package:fb_fitbody/features/cart/presentation/widgets/cart_items_skeleton.dart';
import 'package:fb_fitbody/features/product/data/models/hive_product_model.dart';
import 'package:fb_fitbody/features/product/presentation/cubit/hive_cubit.dart';
import 'package:fb_fitbody/features/wishlist/presentation/widgets/whish_list_items_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HiveCubit, HiveState>(
      builder: (context, state) {
        if (state is HiveProductLoaded) {
          final products = state.products;
          if (products.isEmpty) {
            return EmptyStateActionSection(
              imagePath: Assets.assetsImages01OnlineShopping2,
              title: 'Your wishlist is empty',
              description:
                  'Tap heart button to start saving your favorite items.',
              buttonText: 'Explore Categories',
              onButtonPressed: () {
                Navigator.pushNamed(context, RoutesName.categories);
              },
            );
          }
          return WhishListItemsListView(
            products: products
                .map((product) => HiveProductModel.fromEntity(product))
                .toList(),
          );
        }
        return const CartItemsSkeleton();
      },
    );
  }
}
