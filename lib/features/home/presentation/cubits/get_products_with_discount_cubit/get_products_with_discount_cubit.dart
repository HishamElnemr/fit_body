import 'package:bloc/bloc.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_entity.dart';
import 'package:fb_fitbody/features/product/domain/repositories/product_repo.dart';
import 'package:meta/meta.dart';

part 'get_products_with_discount_state.dart';

class GetProductsWithDiscountCubit extends Cubit<GetProductsWithDiscountState> {
  GetProductsWithDiscountCubit({required this.productRepo})
    : super(GetProductsWithDiscountInitial());
  final ProductRepo productRepo;

  Future<void> getProductsWithDiscount() async {
    emit(GetProductsWithDiscountLoading());
    final result = await productRepo.getProductsByDiscount();
    result.fold(
      (failure) =>
          emit(GetProductsWithDiscountError(message: failure.errMessage)),
      (productEntity) =>
          emit(GetProductsWithDiscountSuccess(productEntity: productEntity)),
    );
  }
}
