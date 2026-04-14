import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/features/product/data/models/hive_product_model.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:hive_flutter/adapters.dart';

class HiveServices {
  static Box<HiveProductModel> getHiveBox() =>
      Hive.box<HiveProductModel>(hiveBoxName);

  bool toggleProductInWishlist(ProductDetailsEntity product) {
    final box = getHiveBox();
    if (box.containsKey(product.id)) {
      box.delete(product.id);
      return false;
    } else {
      box.put(product.id, HiveProductModel.fromEntity(product));
      return true;
    }
  }

  bool isProductInWishlist(int productId) {
    final box = getHiveBox();
    return box.containsKey(productId);
  }

  List<ProductDetailsEntity> getWishlistProducts() {
    return List.unmodifiable(
      getHiveBox().values.map((product) => product.toEntity()),
    );
  }
}
