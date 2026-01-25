import 'package:dartz/dartz.dart';
import 'package:fb_fitbody/core/errors/api_product_error.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_entity.dart';

abstract class ProductRepo 
{
    Future<Either<ApiProductErrors, ProductEntity>> getProducts();
    Future<Either<ApiProductErrors, ProductEntity>> getProductsByDiscount();

}