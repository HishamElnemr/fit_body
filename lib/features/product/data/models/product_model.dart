import 'package:fb_fitbody/features/product/domain/entities/product_entity.dart';

import 'product_details_model.dart';

class ProductModel {
  final List<ProductDetailsModel> products;
  final int total;
  final int skip;
  final int limit;

  ProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      products: json['products'] != null
          ? (json['products'] as List)
                .map((v) => ProductDetailsModel.fromJson(v))
                .toList()
          : [],
      total: json['total'] ?? 0,
      skip: json['skip'] ?? 0,
      limit: json['limit'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['products'] = this.products.map((v) => v.toJson()).toList();
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }

  toEntity() {
    return ProductEntity(
      products: products.map((e) => e.toEntity()).toList(),
      total: total,
      skip: skip,
      limit: limit,
    );
  }
}
