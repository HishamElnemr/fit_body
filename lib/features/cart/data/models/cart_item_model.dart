import '../../domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    super.id,
    required super.userId,
    required super.productId,
    required super.title,
    required super.price,
    required super.quantity,
    required super.image,
    required super.discount,
    required super.stockQuantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      image: json['image'],
      discount: (json['discount'] as num).toDouble(),
      stockQuantity: json['stock_quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'user_id': userId,
      'product_id': productId,
      'title': title,
      'price': price,
      'quantity': quantity,
      'image': image,
      'discount': discount,
      'stock_quantity': stockQuantity,
    };
  }

  CartItemEntity toEntity() {
    return CartItemEntity(
      id: id,
      userId: userId,
      productId: productId,
      title: title,
      price: price,
      quantity: quantity,
      image: image,
      discount: discount,
      stockQuantity: stockQuantity,
    );
  }

}
