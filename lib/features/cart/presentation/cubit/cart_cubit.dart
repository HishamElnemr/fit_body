import 'package:bloc/bloc.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_item_model.dart';
import 'package:fb_fitbody/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fb_fitbody/features/cart/domain/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo}) : super(CartInitial());
  final CartRepo cartRepo;

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
      emit(CartSuccess(cartItemEntity: currentList));
    });
  }

  Future<void> getCartItems({required String currentUserId}) async {
    emit(CartLoading());
    final result = await cartRepo.getCartItems(currentUserId: currentUserId);
    result.fold(
      (failure) => emit(CartFailure(errorMessage: failure.message)),
      (cartItemEntities) => emit(CartSuccess(cartItemEntity: cartItemEntities)),
    );
  }
}
