import 'package:bloc/bloc.dart';
import 'package:fb_fitbody/features/categories/domain/repositories/categories_repo.dart';
import 'package:meta/meta.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit({required this.categoriesRepo})
    : super(GetCategoriesInitial());

  final CategoriesRepo categoriesRepo;

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final result = await categoriesRepo.getCategories();
    result.fold(
      (failure) => emit(GetCategoriesFailure(errMessage: failure.errMessage)),
      (categories) => emit(GetCategoriesSuccess(categories: categories)),
    );
  }
}
