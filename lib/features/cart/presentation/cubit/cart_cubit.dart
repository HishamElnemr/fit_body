import 'package:bloc/bloc.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_request_body.dart';
import 'package:fb_fitbody/features/cart/domain/repos/cart_repo.dart';
import 'package:fb_fitbody/features/cart/domain/entities/cart_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo}) : super(CartInitial());
  final CartRepo cartRepo;
  Future<void> addToCart(CartRequestBody body) async {
    emit(CartLoading());
    var result = await cartRepo.addToCart(body);
    result.fold(
      (failure) {
        emit(CartFailure(errorMessage: failure.errMessage));
      },
      (cart) {
        emit(CartSuccess(cart: cart));
      },
    );
  }

  Future<void> updateCart(int cartId, CartRequestBody body) async {
    emit(CartLoading());
    var result = await cartRepo.updateCart(cartId, body);
    result.fold(
      (failure) {
        emit(CartFailure(errorMessage: failure.errMessage));
      },
      (cart) {
        emit(CartSuccess(cart: cart));
      },
    );
  }

  Future<void> deleteCart(int id) async {
    emit(CartLoading());
    var result = await cartRepo.deleteCart(id);
    result.fold(
      (failure) {
        emit(CartFailure(errorMessage: failure.errMessage));
      },
      (cart) {
        emit(CartSuccess(cart: cart));
      },
    );
  }

  Future<void> getUserCart(int userId) async {
    emit(CartLoading());
    var result = await cartRepo.getUserCart(userId);
    result.fold(
      (failure) {
        emit(CartFailure(errorMessage: failure.errMessage));
      },
      (cart) {
        emit(CartSuccess(cart: cart));
      },
    );
  }
}
