import 'package:fb_fitbody/features/auth/domain/entities/user_entity.dart';
import 'package:fb_fitbody/features/cart/presentation/views/cart_view.dart';
import 'package:fb_fitbody/features/categories/presentation/views/categories_view.dart';
import 'package:fb_fitbody/features/home/presentation/views/home_view.dart';
import 'package:fb_fitbody/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:fb_fitbody/features/layout/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:fb_fitbody/features/profile/presentation/views/profile_view.dart';
import 'package:fb_fitbody/features/wishlist/presentation/views/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key, this.user});

  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, int>(
        builder: (context, currentIndex) {
          final screens = [
            const HomeView(),
            const CategoriesView(),
            const CartView(),
            const WishlistView(),
            ProfileView(user: user),
          ];

          return Scaffold(
            body: IndexedStack(index: currentIndex, children: screens),
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<LayoutCubit>().changeLayout(index);
              },
            ),
          );
        },
      ),
    );
  }
}
