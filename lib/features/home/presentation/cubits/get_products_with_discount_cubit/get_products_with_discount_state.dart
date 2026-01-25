part of 'get_products_with_discount_cubit.dart';

@immutable
sealed class GetProductsWithDiscountState {}

final class GetProductsWithDiscountInitial extends GetProductsWithDiscountState {}

final class GetProductsWithDiscountLoading extends GetProductsWithDiscountState {}

final class GetProductsWithDiscountSuccess extends GetProductsWithDiscountState {
  final ProductEntity productEntity;
  GetProductsWithDiscountSuccess({required this.productEntity});
}

final class GetProductsWithDiscountError extends GetProductsWithDiscountState {
  final String message;
  GetProductsWithDiscountError({required this.message});
}
