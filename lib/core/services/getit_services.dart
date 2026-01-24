import 'package:dio/dio.dart';
import 'package:fb_fitbody/core/services/auth_services.dart';
import 'package:fb_fitbody/core/services/get_products_services.dart';
import 'package:fb_fitbody/features/auth/data/repositories/auth_repo_implementation.dart';
import 'package:fb_fitbody/features/auth/domain/repositories/auth_repo.dart';
import 'package:fb_fitbody/features/product/data/repositories/product_repo_implementation.dart';
import 'package:fb_fitbody/features/product/domain/repositories/product_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<AuthServices>(AuthServices(getIt<Dio>()));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(authServices: getIt<AuthServices>()),
  );
  getIt.registerSingleton<GetProductsServices>(
    GetProductsServices(getIt<Dio>()),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImplementation(
      getProductsServices: getIt<GetProductsServices>(),
    ),
  );
}
