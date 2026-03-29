import 'package:bloc/bloc.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_item_model.dart';
import 'package:fb_fitbody/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fb_fitbody/features/cart/domain/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo}) : super(CartInitial());
  final CartRepo cartRepo;

  double calculateSubtotal(
    List<CartItemEntity> items, {
    bool isSelected = true,
  }) {
    return items.fold(
      0,
      (sum, item) => sum + (isSelected ? item.totalOriginalPrice : 0),
    );
  }

  void _emitCartSuccess(List<CartItemEntity> items, {double? subtotal}) {
    emit(
      CartSuccess(
        cartItemEntity: items,
        subtotal: subtotal ?? calculateSubtotal(items),
      ),
    );
  }

  Future<void> addToCart({required CartItemModel cartItemModel}) async {
    final currentList = List<CartItemEntity>.from(
      state is CartSuccess ? (state as CartSuccess).cartItemEntity : [],
    );
    emit(CartLoading());
    final result = await cartRepo.addToCart(cartItemModel: cartItemModel);
    result.fold((failure) => emit(CartFailure(errorMessage: failure.message)), (
      newItem,
    ) {
      final index = currentList.indexWhere(
        (e) => e.productId == newItem.productId,
      );
      if (index != -1) {
        currentList[index] = newItem;
      } else {
        currentList.add(newItem);
      }
      _emitCartSuccess(currentList);
    });
  }

  Future<void> getCartItems({required String currentUserId}) async {
    emit(CartLoading());
    final result = await cartRepo.getCartItems(currentUserId: currentUserId);
    result.fold(
      (failure) => emit(CartFailure(errorMessage: failure.message)),
      (cartItemEntities) => _emitCartSuccess(cartItemEntities),
    );
  }

  Future<void> removeCartItem({required int cartItemId}) async {
    final result = await cartRepo.removeCartItem(cartItemId: cartItemId);

    result.fold((failure) => emit(CartFailure(errorMessage: failure.message)), (
      _,
    ) {
      final currentList = List<CartItemEntity>.from(
        state is CartSuccess ? (state as CartSuccess).cartItemEntity : [],
      );
      currentList.removeWhere((item) => item.id == cartItemId);
      _emitCartSuccess(currentList);
    });
  }

  void updateItemQuantity({required int productId, required int newQuantity}) {
    if (state is! CartSuccess) return;
    final currentList = (state as CartSuccess).cartItemEntity;
    final updatedList = currentList.map((item) {
      if (item.productId == productId) {
        return item.copyWith(quantity: newQuantity);
      }
      return item;
    }).toList();
    _emitCartSuccess(updatedList);
  }

  Future<void> clearCart({required String currentUserId}) async {
    final result = await cartRepo.clearCart(currentUserId: currentUserId);
    result.fold((failure) => emit(CartFailure(errorMessage: failure.message)), (
      _,
    ) {
      _emitCartSuccess([]);
    });
  }
}
