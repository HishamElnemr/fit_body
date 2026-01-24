import 'package:fb_fitbody/core/services/getit_services.dart';
import 'package:fb_fitbody/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/home_view_bloc_builder.dart';
import 'package:fb_fitbody/features/product/domain/repositories/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetProductsCubit(productRepo: getIt<ProductRepo>())..getProducts(),
      child: const Scaffold(
        appBar: CustomHomeAppBar(),
        body: SafeArea(child: HomeViewBlocBuilder()),
      ),
    );
  }
}
