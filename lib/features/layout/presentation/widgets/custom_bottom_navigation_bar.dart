import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/features/layout/presentation/widgets/custom_nav_bar_items.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryFixed,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.onTertiary,
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: InactiveIcon(
              iconPath: Assets.assetsImagesHomeInactive,
              name: 'Home',
            ),
            activeIcon: ActiveIcon(
              iconPath: Assets.assetsImagesHomeActive,
              name: 'Home',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InactiveIcon(
              iconPath: Assets.assetsImagesCategoryInactive,
              name: 'Categories',
            ),
            activeIcon: ActiveIcon(
              iconPath: Assets.assetsImagesCategoryActive,
              name: 'Categories',
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: InactiveIcon(
              iconPath: Assets.assetsImagesShoppingCartInactive,
              name: 'My Cart',
            ),
            activeIcon: ActiveIcon(
              iconPath: Assets.assetsImagesShoppingCartActive,
              name: 'My Cart',
            ),
            label: 'My Cart',
          ),
          BottomNavigationBarItem(
            icon: InactiveIcon(
              iconPath: Assets.assetsImagesHeartInactive,
              name: 'Wishlist',
            ),
            activeIcon: ActiveIcon(
              iconPath: Assets.assetsImagesHeartActive,
              name: 'Wishlist',
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: InactiveIcon(
              iconPath: Assets.assetsImagesProfileInactive,
              name: 'Profile',
            ),
            activeIcon: ActiveIcon(
              iconPath: Assets.assetsImagesProfileActive,
              name: 'Profile',
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
