import 'package:bloc/bloc.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_entity.dart';
import 'package:fb_fitbody/features/search/domain/repositories/search_for_products_repo.dart';
import 'package:meta/meta.dart';

part 'search_for_product_state.dart';

class SearchForProductCubit extends Cubit<SearchForProductState> {
  SearchForProductCubit(this.searchForProductsRepo)
    : super(SearchForProductInitial());
  final SearchForProductsRepo searchForProductsRepo;

  Future<void> searchForProducts({required String query}) async {
    emit(SearchForProductLoading());
    final result = await searchForProductsRepo.searchForProducts(query);
    result.fold(
      (failure) => emit(SearchForProductFailure(failure.errMessage)),
      (productEntity) => emit(SearchForProductSuccess(productEntity)),
    );
  }
}
