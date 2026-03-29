import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_back_title_app_bar.dart';
import 'package:fb_fitbody/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      titleSpacing: 0,
      title: Navigator.canPop(context)
          ? const BackTitleBarContent(title: 'My Cart')
          : Text('My Cart', style: AppStyles.body2Medium14(context)),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Theme.of(context).colorScheme.onTertiary,
          height: 1,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            context.read<CartCubit>().clearCart(currentUserId: '123');
          },
          child: Text(
            'Clear Cart',
            style: AppStyles.body2Medium14(
              context,
            ).copyWith(color: AppColors.red),
          ),
        ),
      ],
    );
  }
}
