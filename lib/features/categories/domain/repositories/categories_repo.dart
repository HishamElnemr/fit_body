import 'package:dartz/dartz.dart';
import 'package:fb_fitbody/core/errors/api_product_error.dart';

abstract class CategoriesRepo {
  Future<Either<ApiProductErrors, List<String>>> getCategories();
}
