import 'package:fb_fitbody/core/theme/cubit/change_theme_cubit.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/product_image_stack.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsAppBar extends StatelessWidget {
  final ProductDetailsEntity arguments;
  final bool isScrolled;

  const DetailsAppBar({
    super.key,
    required this.arguments,
    required this.isScrolled,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      shape: isScrolled
          ? Border(
              bottom: BorderSide(color: Theme.of(context).colorScheme.outline),
            )
          : null,
      expandedHeight: MediaQuery.sizeOf(context).height * 0.4,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: Center(
        child: _buildAppBarIcon(
          context,
          icon: Assets.assetsImagesArrowLeft,
          onTap: () => Navigator.pop(context),
        ),
      ),
      actions: [
        _buildAppBarIcon(
          context,
          icon: Assets.assetsImagesSearchNormal,
          onTap: () {},
        ),
        const SizedBox(width: 12),
        _buildAppBarIcon(
          context,
          icon: Assets.assetsImagesFavorite,
          onTap: () {
            context.read<ChangeThemeCubit>().toggleTheme();
          },
        ),
        const SizedBox(width: 16),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: ProductImageStack(images: arguments.images),
      ),
    );
  }

  Widget _buildAppBarIcon(
    BuildContext context, {
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 32,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primaryFixed,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
