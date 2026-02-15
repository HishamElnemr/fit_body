import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/details_app_bar.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/product_details_widget.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsViewBodyBlocConsumer extends StatelessWidget {
  const DetailsViewBodyBlocConsumer({
    super.key,
    required this.scrollController,
    required this.isScrolled,
    required this.arguments,
  });

  final ScrollController scrollController;
  final bool isScrolled;
  final ProductDetailsEntity arguments;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added to cart successfully!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is CartFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: kHorizontalPadding),
              sliver: DetailsAppBar(
                arguments: arguments,
                isScrolled: isScrolled,
              ),
            ),
            SliverToBoxAdapter(
              child: ProductDetailsWidget(arguments: arguments),
            ),
            if (state is CartLoading)
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
          ],
        );
      },
    );
  }
}
