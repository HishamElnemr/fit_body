import 'package:dio/dio.dart';
import 'package:fb_fitbody/core/constants/api_constants.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_model.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_services.g.dart';

@RestApi(baseUrl: ApiConstants.productsBaseUrl)
abstract class CartServices {
  factory CartServices(Dio dio) = _CartServices;

  @POST('carts/add')
  Future<CartModel> addToCart(@Body() CartRequestBody body);

  @PUT('carts/{id}')
  Future<CartModel> updateCart(
    @Path('id') int cartId,
    @Body() CartRequestBody body,
  );

  @GET('carts/user/{userId}')
  Future<CartModel> getUserCart(@Path('userId') int userId);

  @DELETE('carts/{id}')
  Future<CartModel> deleteCart(@Path('id') int id);
}
