part of 'hive_cubit.dart';

@immutable
sealed class HiveState {}

final class HiveInitial extends HiveState {}

final class HiveProductAdded extends HiveState {
  final ProductDetailsEntity product;
  HiveProductAdded(this.product);
}

final class HiveProductRemoved extends HiveState {
  final int productId;
  HiveProductRemoved(this.productId);
}

final class HiveProductLoaded extends HiveState {
  final List<ProductDetailsEntity> products;
  HiveProductLoaded(List<ProductDetailsEntity> products)
    : products = List.unmodifiable(products);
}
