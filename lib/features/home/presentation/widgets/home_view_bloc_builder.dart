import 'package:fb_fitbody/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBlocBuilder extends StatelessWidget {
  const HomeViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GetProductsSuccess) {
          return HomeViewBody(productEntity: state.productEntity);
        }
        if (state is GetProductsFailure) {
          return Center(child: Text(state.errMessage));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
