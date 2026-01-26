import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/core/services/getit_services.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/widgets/custom_app_bar.dart';
import 'package:fb_fitbody/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:fb_fitbody/features/home/presentation/cubits/get_products_with_discount_cubit/get_products_with_discount_cubit.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/home_view_body.dart';
import 'package:fb_fitbody/features/product/domain/repositories/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetProductsCubit(productRepo: getIt<ProductRepo>())
                ..getProducts(),
        ),
        BlocProvider(
          create: (context) =>
              GetProductsWithDiscountCubit(productRepo: getIt<ProductRepo>())
                ..getProductsWithDiscount(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          icon: Assets.assetsImagesSearchNormal,
          onTap: () {
            Navigator.pushNamed(context, RoutesName.search);
          },
        ),
        body: const SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
