import '../../domain/entities/cart_entity.dart';
import 'cart_item_model.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.id,
    required super.userId,
    required super.total,
    required super.discountedTotal,
    required super.totalProducts,
    required super.totalQuantity,
    required super.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      total: (json['total'] as num).toDouble(),
      discountedTotal: (json['discountedTotal'] as num).toDouble(),
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
      products: (json['products'] as List)
          .map((e) => CartItemModel.fromJson(e).toEntity())
          .toList(),
    );
  }

  CartEntity toEntity() {
    return CartEntity(
      id: id,
      userId: userId,
      total: total,
      discountedTotal: discountedTotal,
      totalProducts: totalProducts,
      totalQuantity: totalQuantity,
      products: products,
    );
  }
}
