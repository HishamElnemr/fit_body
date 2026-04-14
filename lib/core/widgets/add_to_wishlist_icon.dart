import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:fb_fitbody/features/product/presentation/cubit/hive_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AddToWishlistIconVariant { regular, appBar }

class AddToWishlistIcon extends StatefulWidget {
  const AddToWishlistIcon({
    super.key,
    required this.productDetailsEntity,
    this.variant = AddToWishlistIconVariant.regular,
  });

  final ProductDetailsEntity productDetailsEntity;
  final AddToWishlistIconVariant variant;

  @override
  State<AddToWishlistIcon> createState() => _AddToWishlistIconState();
}

class _AddToWishlistIconState extends State<AddToWishlistIcon> {
  late bool isInWishlist;

  @override
  void initState() {
    super.initState();
    isInWishlist = context.read<HiveCubit>().hiveServices.isProductInWishlist(
      widget.productDetailsEntity.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HiveCubit, HiveState>(
      listener: (context, state) {
        if (state is HiveProductAdded &&
            state.product.id == widget.productDetailsEntity.id) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${widget.productDetailsEntity.title} Added to wishlist',
                style: AppStyles.body2Medium14(context),
              ),
              duration: const Duration(seconds: 1),
            ),
          );
        } else if (state is HiveProductRemoved &&
            state.productId == widget.productDetailsEntity.id) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${widget.productDetailsEntity.title} Removed from wishlist',
                style: AppStyles.captionRegular12(context),
              ),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      child: GestureDetector(
        onTap: () {
          context.read<HiveCubit>().toggleProductInWishlist(
            widget.productDetailsEntity,
          );
          setState(() {
            isInWishlist = context
                .read<HiveCubit>()
                .hiveServices
                .isProductInWishlist(widget.productDetailsEntity.id);
          });
        },
        child: _buildIcon(context),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    final icon = SvgPicture.asset(
      isInWishlist
          ? Assets.assetsImagesFavoriteActive
          : Assets.assetsImagesFavorite,
      color: isInWishlist
          ? Colors.red
          : Theme.of(context).colorScheme.primaryFixed,
    );

    if (widget.variant == AddToWishlistIconVariant.appBar) {
      return Container(
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
        child: icon,
      );
    }

    return icon;
  }
}
