import 'package:fb_fitbody/core/constants/api_constants.dart';
import 'package:fb_fitbody/features/cart/data/models/cart_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartServices {
  Future<void> addCartItem(CartItemModel cartItemModel) async {
    await Supabase.instance.client
        .from(ApiConstants.cartTable)
        .upsert(cartItemModel.toJson(), onConflict: 'product_id,user_id')
        .select()
        .single();
  }

  Future<List<Map<String, dynamic>>> getCartItems({required String currentUserId}) async {
    final response = await Supabase.instance.client
        .from(ApiConstants.cartTable)
        .select()
        .eq('user_id', currentUserId);
    return response;
  }
}
