import 'package:dartz/dartz.dart';
import 'package:fb_fitbody/core/errors/supabase_storage_failure.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_item_model.dart';
import 'package:fb_fitbody/features/cart/domain/entities/cart_item_entity.dart';

abstract class CartRepo {
  Future<Either<SupabaseStorageFailure, CartItemEntity>> addToCart({
    required CartItemModel cartItemModel,
  });

  Future<Either<SupabaseStorageFailure, List<CartItemEntity>>> getCartItems({
    required String currentUserId,
  });

  Future<Either<SupabaseStorageFailure, void>> removeCartItem({
    required int cartItemId,
  });

  Future<Either<SupabaseStorageFailure, void>> clearCart({
    required String currentUserId,
  });
}
