import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fb_fitbody/core/errors/supabase_storage_failure.dart';
import 'package:fb_fitbody/core/services/cart_services.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_item_model.dart';
import 'package:fb_fitbody/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fb_fitbody/features/cart/domain/repos/cart_repo.dart';

class CartRepoImplementation implements CartRepo {
  final CartServices cartServices;
  CartRepoImplementation({required this.cartServices});

  @override
  Future<Either<SupabaseStorageFailure, CartItemEntity>> addToCart({
    required CartItemModel cartItemModel,
  }) async {
    try {
      final cartItem = await cartServices.addOrUpdateCartItem(cartItemModel);
      return right(cartItem.toEntity());
    } catch (e) {
      log(e.toString());
      return left(StorageFailure.fromException(e));
    }
  }

  @override
  Future<Either<SupabaseStorageFailure, List<CartItemEntity>>> getCartItems({
    required String currentUserId,
  }) async {
    try {
      final cartItems = await cartServices.getCartItems(
        currentUserId: currentUserId,
      );
      final List<CartItemModel> cartItemModels = cartItems
          .map((item) => CartItemModel.fromJson(item))
          .toList();
      return right(cartItemModels.map((model) => model.toEntity()).toList());
    } catch (e) {
      return left(StorageFailure.fromException(e));
    }
  }

  @override
  Future<Either<SupabaseStorageFailure, void>> removeCartItem({
    required int cartItemId,
  }) async {
    try {
      await cartServices.removeCartItem(cartItemId: cartItemId);
      return right(null);
    } catch (e) {
      return left(StorageFailure.fromException(e));
    }
  }

  @override
  Future<Either<SupabaseStorageFailure, void>> clearCart({
    required String currentUserId,
  }) async {
    try {
      await cartServices.clearCart(currentUserId: currentUserId);
      return right(null);
    } catch (e) {
      return left(StorageFailure.fromException(e));
    }
  }
}
