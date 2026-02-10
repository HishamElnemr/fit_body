import 'package:fb_fitbody/features/cart/presentation/views/cart_view.dart';
import 'package:fb_fitbody/features/home/presentation/views/home_view.dart';
import 'package:fb_fitbody/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:fb_fitbody/features/layout/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  static const List<Widget> _screens = [
    HomeView(),
    Scaffold(body: Center(child: Text('Categories'))),
    CartView(),
    Scaffold(body: Center(child: Text('Wishlist'))),
    Scaffold(body: Center(child: Text('Profile'))),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: IndexedStack(index: currentIndex, children: _screens),
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
