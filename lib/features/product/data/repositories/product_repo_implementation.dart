import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fb_fitbody/core/errors/api_product_error.dart';
import 'package:fb_fitbody/core/services/get_products_services.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_entity.dart';
import 'package:fb_fitbody/features/product/domain/repositories/product_repo.dart';

class ProductRepoImplementation implements ProductRepo {
  final GetProductsServices getProductsServices;

  ProductRepoImplementation({required this.getProductsServices});
  @override
  Future<Either<ApiProductErrors, ProductEntity>> getProducts() async {
    try {
      final response = await getProductsServices.getProducts();
      return right(response.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
