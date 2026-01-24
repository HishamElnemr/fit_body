import 'package:bloc/bloc.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_entity.dart';
import 'package:fb_fitbody/features/product/domain/repositories/product_repo.dart';
import 'package:meta/meta.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit({required this.productRepo}) : super(GetProductsInitial());

  final ProductRepo productRepo;

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(GetProductsFailure(errMessage: failure.errMessage)),
      (productEntity) => emit(GetProductsSuccess(productEntity: productEntity)),
    );
  }
}
