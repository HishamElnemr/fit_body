import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_back_title_app_bar.dart';
import 'package:flutter/material.dart';

class PageTitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PageTitleAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
      ),
      title: Navigator.canPop(context)
          ? BackTitleBarContent(title: title)
          : Text(title, style: AppStyles.body2Medium14(context)),
    );
  }
}
