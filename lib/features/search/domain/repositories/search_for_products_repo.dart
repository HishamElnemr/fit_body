import 'package:dartz/dartz.dart';
import 'package:fb_fitbody/core/errors/api_product_error.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_entity.dart';

abstract class SearchForProductsRepo {
  Future<Either<ApiProductErrors, ProductEntity>> searchForProducts(
    String query,
    String? sortBy,
    String? order,
  );
}
