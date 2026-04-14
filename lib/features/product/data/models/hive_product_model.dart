import 'package:fb_fitbody/features/product/domain/entities/dimensions_entity.dart';
import 'package:fb_fitbody/features/product/domain/entities/meta_entity.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
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

  factory HiveProductModel.fromEntity(ProductDetailsEntity productEntity) {
    return HiveProductModel(
      id: productEntity.id,
      imageUrl: productEntity.thumbnail,
      title: productEntity.title,
      price: productEntity.price,
      oldPrice:
          productEntity.price * (1 + productEntity.discountPercentage / 100),
      quantity: 1,
    );
  }

  ProductDetailsEntity toEntity() {
    return ProductDetailsEntity(
      id: id,
      title: title,
      description: '',
      category: '',
      price: price,
      discountPercentage: 0,
      rating: 0,
      stock: 0,
      tags: [],
      brand: '',
      sku: '',
      weight: 0,
      dimensions: const DimensionsEntity(width: 100, height: 100, depth: 100),
      warrantyInformation: '',
      shippingInformation: '',
      availabilityStatus: '',
      reviews: [],
      returnPolicy: '',
      minimumOrderQuantity: 0,
      meta: const MetaEntity(
        createdAt: '',
        updatedAt: '',
        barcode: '',
        qrCode: '',
      ),
      images: [imageUrl],
      thumbnail: imageUrl,
    );
  }
}
