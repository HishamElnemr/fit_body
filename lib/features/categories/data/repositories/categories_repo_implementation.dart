import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fb_fitbody/core/errors/api_product_error.dart';
import 'package:fb_fitbody/core/services/get_products_services.dart';
import 'package:fb_fitbody/features/categories/domain/repositories/categories_repo.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_entity.dart';

class CategoriesRepoImplementation implements CategoriesRepo {
  CategoriesRepoImplementation(this.getProductsServices);

  final GetProductsServices getProductsServices;

  @override
  Future<Either<ApiProductErrors, List<String>>> getCategories() async {
    try {
      final response = await getProductsServices.getCategories();
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ApiProductErrors, ProductEntity>> getProductsByCategory({
    required String category,
    String? sortBy,
    String? order,
  }) async {
    try {
      final response = await getProductsServices.getProductsByCategory(
        category: category,
        sortBy: sortBy,
        order: order,
      );
      return right(response.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
