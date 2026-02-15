class CartItemRequest {
  final int id;
  final int quantity;

  CartItemRequest({required this.id, required this.quantity});

  Map<String, dynamic> toJson() {
    return {'id': id, 'quantity': quantity};
  }
}
