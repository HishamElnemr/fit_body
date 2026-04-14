import 'package:bloc/bloc.dart';
import 'package:fb_fitbody/core/services/hive_serices.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:meta/meta.dart';

part 'hive_state.dart';

class HiveCubit extends Cubit<HiveState> {
  HiveCubit({required this.hiveServices}) : super(HiveInitial());
  final HiveServices hiveServices;

  void toggleProductInWishlist(ProductDetailsEntity product) {
    final isAdded = hiveServices.toggleProductInWishlist(product);
    if (isAdded) {
      emit(HiveProductAdded(product));
    } else {
      emit(HiveProductRemoved(product.id));
    }
    loadWishlistProducts();
  }

  void loadWishlistProducts() {
    final products = hiveServices.getWishlistProducts();
    emit(HiveProductLoaded(products));
  }
}
