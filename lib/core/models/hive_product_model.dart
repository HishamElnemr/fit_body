import 'package:hive_flutter/hive_flutter.dart';

part 'hive_product_model.g.dart';

@HiveType(typeId: 0)
class HiveProductModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final double oldPrice;

  @HiveField(5)
  final int quantity;
  const HiveProductModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.quantity,
  });
}
