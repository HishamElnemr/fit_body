import 'cart_item_entity.dart';

class CartEntity {
  final int id;
  final int userId;
  final double total;
  final double discountedTotal;
  final int totalProducts;
  final int totalQuantity;
  final List<CartItemEntity> products;

  const CartEntity({
    required this.id,
    required this.userId,
    required this.total,
    required this.discountedTotal,
    required this.totalProducts,
    required this.totalQuantity,
    required this.products,
  });
}
