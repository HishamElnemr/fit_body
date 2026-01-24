import 'package:dio/dio.dart';
import 'package:fb_fitbody/core/constants/api_constants.dart';
import 'package:fb_fitbody/features/product/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'get_products_services.g.dart';

@RestApi(baseUrl: ApiConstants.productsBaseUrl)
abstract class GetProductsServices {
  factory GetProductsServices(Dio dio) = _GetProductsServices;

  @GET('products')
  Future<ProductModel> getProducts();
}
