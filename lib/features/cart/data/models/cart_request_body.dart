import 'package:fb_fitbody/features/cart/data/models/cart_item_request.dart';

class CartRequestBody {
  final int userId;
  final List<CartItemRequest> products;

  CartRequestBody({required this.userId, required this.products});

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'products': products.map((e) => e.toJson()).toList(),
    };
  }
}
