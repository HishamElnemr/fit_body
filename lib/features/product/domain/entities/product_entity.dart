
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';

class ProductEntity {
  final List<ProductDetailsEntity> products;
  final int total;
  final int skip;
  final int limit;

  const ProductEntity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });
}
