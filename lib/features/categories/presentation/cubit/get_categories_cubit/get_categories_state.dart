part of 'get_categories_cubit.dart';

@immutable
sealed class GetCategoriesState {}

final class GetCategoriesInitial extends GetCategoriesState {}

final class GetCategoriesLoading extends GetCategoriesState {}

final class GetCategoriesSuccess extends GetCategoriesState {
  GetCategoriesSuccess({required this.categories});

  final List<String> categories;
}

final class GetCategoriesFailure extends GetCategoriesState {
  GetCategoriesFailure({required this.errMessage});

  final String errMessage;
}
