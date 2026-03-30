import 'package:dartz/dartz.dart';
import 'package:fb_fitbody/core/errors/api_product_error.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_entity.dart';

abstract class CategoriesRepo {
  Future<Either<ApiProductErrors, List<String>>> getCategories();
  Future<Either<ApiProductErrors, ProductEntity>> getProductsByCategory({
    required String category,
    String? sortBy,
    String? order,
  });
}
