part of 'search_for_product_cubit.dart';

@immutable
sealed class SearchForProductState {}

final class SearchForProductInitial extends SearchForProductState {}

final class SearchForProductLoading extends SearchForProductState {}

final class SearchForProductSuccess extends SearchForProductState {
  final ProductEntity productEntity;
  SearchForProductSuccess(this.productEntity);
}

final class SearchForProductFailure extends SearchForProductState {
  final String errorMessage;
  SearchForProductFailure(this.errorMessage);
}
