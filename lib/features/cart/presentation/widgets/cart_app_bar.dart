import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      titleSpacing: Navigator.canPop(context) ? 0 : 16,
      title: Navigator.canPop(context)
          ? Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(Assets.assetsImagesArrowLeft),
                    ),
                  ),
                ),
                Text('My Cart', style: AppStyles.body2Medium14(context)),
              ],
            )
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
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              'Voucher Code',
              style: AppStyles.body2Medium14(
                context,
              ).copyWith(color: AppColors.cyan),
            ),
          ),
        ),
      ],
    );
  }
}
