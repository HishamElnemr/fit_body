part of 'get_products_by_categories_cubit.dart';

@immutable
sealed class GetProductsByCategoryState {}

final class GetProductsInitial extends GetProductsByCategoryState {}

final class GetProductsLoading extends GetProductsByCategoryState {}

final class GetProductsSuccess extends GetProductsByCategoryState {
  final ProductEntity productEntity;
  GetProductsSuccess({required this.productEntity});
}

final class GetProductsFailure extends GetProductsByCategoryState {
  final String errMessage;
  GetProductsFailure({required this.errMessage});
}

