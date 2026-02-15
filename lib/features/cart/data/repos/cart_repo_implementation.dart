import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fb_fitbody/core/errors/api_product_error.dart';
import 'package:fb_fitbody/core/services/cart_services.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_request_body.dart';
import 'package:fb_fitbody/features/cart/domain/entities/cart_entity.dart';
import 'package:fb_fitbody/features/cart/domain/repos/cart_repo.dart';

class CartRepoImplementation implements CartRepo {
  final CartServices cartServices;
  CartRepoImplementation({required this.cartServices});
  @override
  Future<Either<ApiProductErrors, CartEntity>> addToCart(
    CartRequestBody body,
  ) async {
    try {
      var data = await cartServices.addToCart(body);
      return right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<ApiProductErrors, CartEntity>> deleteCart(int id) async {
    try {
      var data = await cartServices.deleteCart(id);
      return right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<ApiProductErrors, CartEntity>> getUserCart(int userId) async {
    try {
      var data = await cartServices.getUserCart(userId);
      return right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<ApiProductErrors, CartEntity>> updateCart(
    int cartId,
    CartRequestBody body,
  ) async {
    try {
      var data = await cartServices.updateCart(cartId, body);
      return right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
