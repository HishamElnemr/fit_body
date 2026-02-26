import 'package:fb_fitbody/core/constants/api_constants.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartServices {
  final SupabaseClient supabaseClient;

  CartServices({required this.supabaseClient});

  Future<CartItemModel> addOrUpdateCartItem(CartItemModel cartItemModel) async {
    final currentCartItem = await supabaseClient
        .from(ApiConstants.cartTable)
        .select('id, quantity')
        .eq('product_id', cartItemModel.productId)
        .eq('user_id', cartItemModel.userId)
        .maybeSingle();

    if (currentCartItem != null) {
      final updatedQuantity =
          currentCartItem['quantity'] + cartItemModel.quantity;
      final response = await supabaseClient
          .from(ApiConstants.cartTable)
          .update({'quantity': updatedQuantity})
          .eq('id', currentCartItem['id'])
          .select()
          .maybeSingle();
      return CartItemModel.fromJson(response!);
    } else {
      final response = await supabaseClient
          .from(ApiConstants.cartTable)
          .upsert(cartItemModel.toJson(), onConflict: 'product_id,user_id')
          .select()
          .single();
      return CartItemModel.fromJson(response);
    }
  }

  Future<List<Map<String, dynamic>>> getCartItems({
    required String currentUserId,
  }) async {
    final response = await supabaseClient
        .from(ApiConstants.cartTable)
        .select()
        .eq('user_id', currentUserId);
    return response;
  }

  Future<void> removeCartItem({required int cartItemId}) async {
    await supabaseClient
        .from(ApiConstants.cartTable)
        .delete()
        .eq('id', cartItemId);
  }

  Future<void> clearCart({required String currentUserId}) async {
    await supabaseClient
        .from(ApiConstants.cartTable)
        .delete()
        .eq('user_id', currentUserId);
  }


}
