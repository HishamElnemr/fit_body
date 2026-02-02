import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fb_fitbody/core/errors/api_product_error.dart';
import 'package:fb_fitbody/core/services/get_products_services.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_entity.dart';
import 'package:fb_fitbody/features/search/domain/repositories/search_for_products_repo.dart';

class SearchForProductsRepoImplementation implements SearchForProductsRepo {
  SearchForProductsRepoImplementation(this.getProductsServices);
  final GetProductsServices getProductsServices;
  @override
  Future<Either<ApiProductErrors, ProductEntity>> searchForProducts(
    String query,
    String? sortBy,
    String? order,
  ) async {
    try {
      final response = await getProductsServices.searchProducts(
        query: query,
        sortBy: sortBy,
        order: order,
      );
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
