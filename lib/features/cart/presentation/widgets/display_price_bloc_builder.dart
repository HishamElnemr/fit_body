import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fb_fitbody/features/cart/presentation/cubit/cart_counter_cubit/cart_counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayProductPriceBlocBuilder extends StatelessWidget {
  const DisplayProductPriceBlocBuilder({
    super.key,
    required this.cartItemEntity,
  });

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCounterCubit, double>(
      builder: (context, totalPrice) {
        final price = totalPrice == 0
            ? cartItemEntity.totalOriginalPrice
            : totalPrice;
        return Text(
          '${price.toStringAsFixed(2)} \$',
          style: AppStyles.heading3Bold18(context),
        );
      },
    );
  }
}
