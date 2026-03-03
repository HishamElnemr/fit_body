import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/add_to_cart_snackbar.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/cart_loading_overlay.dart';
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
      listener: _onCartStateChanged,
      builder: (context, state) {
        final isLoading = state is CartLoading;

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
            if (isLoading)
              const SliverToBoxAdapter(child: CartLoadingOverlay()),
          ],
        );
      },
    );
  }

  void _onCartStateChanged(BuildContext context, CartState state) {
    final route = ModalRoute.of(context);
    if (route != null && !route.isCurrent) return;

    if (state is CartSuccess) {
      showAddToCartSuccessSnackBar(context);
    } else if (state is CartFailure) {
      showCartFailureSnackBar(context, state.errorMessage);
    }
  }
}
