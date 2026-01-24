import '../../domain/entities/product_details_entity.dart';
import 'dimensions.dart';
import 'meta.dart';
import 'reviews.dart';

class ProductDetailsModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Reviews> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight: json['weight'] ?? 0,
      dimensions: json['dimensions'] != null
          ? Dimensions.fromJson(json['dimensions'])
          : Dimensions(width: 0, height: 0, depth: 0),
      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      reviews: json['reviews'] != null
          ? (json['reviews'] as List).map((v) => Reviews.fromJson(v)).toList()
          : [],
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,
      meta: json['meta'] != null
          ? Meta.fromJson(json['meta'])
          : Meta(createdAt: '', updatedAt: '', barcode: '', qrCode: ''),
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      thumbnail: json['thumbnail'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['tags'] = this.tags;
    data['brand'] = this.brand;
    data['sku'] = this.sku;
    data['weight'] = this.weight;
    data['dimensions'] = this.dimensions.toJson();
    data['warrantyInformation'] = this.warrantyInformation;
    data['shippingInformation'] = this.shippingInformation;
    data['availabilityStatus'] = this.availabilityStatus;
    data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    data['returnPolicy'] = this.returnPolicy;
    data['minimumOrderQuantity'] = this.minimumOrderQuantity;
    data['meta'] = this.meta.toJson();
    data['images'] = this.images;
    data['thumbnail'] = this.thumbnail;
    return data;
  }

  ProductDetailsEntity toEntity() {
    return ProductDetailsEntity(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      tags: tags,
      brand: brand,
      sku: sku,
      weight: weight,
      dimensions: dimensions.toEntity(),
      warrantyInformation: warrantyInformation,
      shippingInformation: shippingInformation,
      availabilityStatus: availabilityStatus,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      returnPolicy: returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity,
      meta: meta.toEntity(),
      images: images,
      thumbnail: thumbnail,
    );
  }
}
