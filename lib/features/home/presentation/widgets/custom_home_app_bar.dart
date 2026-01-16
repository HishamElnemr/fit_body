import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/theme/cubit/change_theme_cubit.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/widgets/custom_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

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
            onTap: () {
              context.read<ChangeThemeCubit>().toggleTheme();
            },
            child: SvgPicture.asset(
              Assets.assetsImagesSearchNormal,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
