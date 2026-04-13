import 'package:fb_fitbody/features/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  static const List<_WishlistItemModel> _items = [
    _WishlistItemModel(
      imageUrl:
          'https://www.figma.com/api/mcp/asset/1000e10a-8922-42b8-ab58-c1428030a454',
      title: 'Loop Silicone Strong Magnetic Watch',
      price: 15.25,
      oldPrice: 20.00,
      quantity: 1,
    ),
    _WishlistItemModel(
      imageUrl:
          'https://www.figma.com/api/mcp/asset/545f6e32-b648-47df-9612-f91e17561a7e',
      title: 'M6 Smart watch IP67 Waterproof',
      price: 12.00,
      oldPrice: 18.00,
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: _items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = _items[index];
        return WishlistItem(
          imageUrl: item.imageUrl,
          title: item.title,
          price: item.price,
          oldPrice: item.oldPrice,
          quantity: item.quantity,
        );
      },
    );
  }
}

class _WishlistItemModel {
  const _WishlistItemModel({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.quantity,
  });

  final String imageUrl;
  final String title;
  final double price;
  final double oldPrice;
  final int quantity;
}
