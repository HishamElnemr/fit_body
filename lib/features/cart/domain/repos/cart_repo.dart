import 'package:dartz/dartz.dart';
import 'package:fb_fitbody/core/errors/api_product_error.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_request_body.dart';
import 'package:fb_fitbody/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepo {
  Future<Either<ApiProductErrors, CartEntity>> addToCart(CartRequestBody body);
  Future<Either<ApiProductErrors, CartEntity>> updateCart(
    int cartId,
    CartRequestBody body,
  );
  Future<Either<ApiProductErrors, CartEntity>> getUserCart(int userId);
  Future<Either<ApiProductErrors, CartEntity>> deleteCart(int id);
}