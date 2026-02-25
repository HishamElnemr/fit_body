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
      await cartServices.addCartItem(cartItemModel);
      return right(cartItemModel.toEntity());
    } catch (e) {
      return left(StorageFailure(e.toString()));
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
      return left(StorageFailure(e.toString()));
    }
  }
}
