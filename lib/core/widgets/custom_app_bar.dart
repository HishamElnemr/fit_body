import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/widgets/custom_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.icon, required this.onTap});
  final String icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: kHorizontalPadding,
      title: const CustomLogoWidget(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: kHorizontalPadding),
          child: GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              icon,
              color: Theme.of(context).colorScheme.onSecondary,
              height: 32,
              width: 32,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
