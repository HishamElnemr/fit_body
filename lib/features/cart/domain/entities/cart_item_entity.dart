class CartItemEntity {
  final int? id;
  final String userId;
  final int productId;
  final String title;
  final double price;
  final int quantity;
  final String image;
  final double discount;
  final int stockQuantity;

  const CartItemEntity({
    this.id,
    required this.userId,
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
    required this.image,
    required this.discount,
    required this.stockQuantity,
  });

  double get priceAfterDiscount {
    return price - (price * discount / 100);
  }

  double get totalOriginalPrice {
    return price * quantity;
  }

  double get totalFinalPrice {
    return priceAfterDiscount * quantity;
  }

  CartItemEntity copyWith({
    int? id,
    String? userId,
    int? productId,
    String? title,
    double? price,
    int? quantity,
    String? image,
    double? discount,
    int? stockQuantity,
  }) {
    return CartItemEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
      discount: discount ?? this.discount,
      stockQuantity: stockQuantity ?? this.stockQuantity,
    );
  }
}
