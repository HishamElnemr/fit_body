import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryProductsAppBar extends StatelessWidget {
  const CategoryProductsAppBar({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 70,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
      ),
      title: Row(
        children: [
          const _CategoryProductsBackButton(),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              categoryName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.body1SemiBold16(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryProductsBackButton extends StatelessWidget {
  const _CategoryProductsBackButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: SvgPicture.asset(
        Assets.assetsImagesArrowLeft,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onSecondary,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
      ),
    );
  }
}
