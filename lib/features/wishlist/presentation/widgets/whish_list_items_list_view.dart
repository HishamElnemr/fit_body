import 'package:fb_fitbody/features/product/data/models/hive_product_model.dart';
import 'package:fb_fitbody/features/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';

class WhishListItemsListView extends StatelessWidget {
  const WhishListItemsListView({super.key, required this.products});

  final List<HiveProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: products.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return WishlistItem(hiveProductModel: products[index]);
      },
    );
  }
}
