import 'package:fb_fitbody/features/home/presentation/cubits/get_products_with_discount_cubit/get_products_with_discount_cubit.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner_page_view.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/promotional_banner/promotional_banner_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromotionalBannerBlocBuilder extends StatelessWidget {
  const PromotionalBannerBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetProductsWithDiscountCubit,
      GetProductsWithDiscountState
    >(
      builder: (context, state) {
        if (state is GetProductsWithDiscountLoading) {
          return const PromotionalBannerSkeleton();
        }
        if (state is GetProductsWithDiscountSuccess) {
          return PromotionalBannerPageView(
            productDetailsEntity: state.productEntity.products,
          );
        }
        if (state is GetProductsWithDiscountError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
