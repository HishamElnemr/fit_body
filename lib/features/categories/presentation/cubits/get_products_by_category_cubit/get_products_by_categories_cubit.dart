import 'package:bloc/bloc.dart';
import 'package:fb_fitbody/features/categories/domain/repositories/categories_repo.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'get_products_by_category_cubit_state.dart';

class GetProductsByCategoryCubit extends Cubit<GetProductsByCategoryState> {
  GetProductsByCategoryCubit({required this.categoriesRepo})
    : super(GetProductsInitial());

  final CategoriesRepo categoriesRepo;

  Future<void> getProductsByCategory({
    required String category,
    String? sortBy,
    String? order,
  }) async {
    emit(GetProductsLoading());
    final result = await categoriesRepo.getProductsByCategory(
      category: category,
      sortBy: sortBy,
      order: order,
    );
    result.fold(
      (failure) => emit(GetProductsFailure(errMessage: failure.errMessage)),
      (productEntity) => emit(GetProductsSuccess(productEntity: productEntity)),
    );
  }
}
