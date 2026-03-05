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
}
