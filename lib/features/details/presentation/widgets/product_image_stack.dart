import 'package:fb_fitbody/core/theme/cubit/change_theme_cubit.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/widgets/custom_cached_network_image.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/image_thumbnail_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductImageStack extends StatefulWidget {
  final List<String> images;
  const ProductImageStack({super.key, required this.images});

  @override
  State<ProductImageStack> createState() => _ProductImageStackState();
}

class _ProductImageStackState extends State<ProductImageStack> {
  int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomCachedNetworkImage(
                    imageUrl: widget.images[selectedImageIndex],
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(
                      Assets.assetsImagesArrowLeft,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primaryFixed,
                        BlendMode.srcIn,
                      ),
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
              ),
              // Favorite icon - top right
              Positioned(
                top: 16,
                right: 16,
                child: GestureDetector(
                  onTap: () => context.read<ChangeThemeCubit>().toggleTheme(),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(
                      Assets.assetsImagesFavorite,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primaryFixed,
                        BlendMode.srcIn,
                      ),
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ImageThumbnailList(
          images: widget.images,
          selectedIndex: selectedImageIndex,
          onImageSelected: (int p1) {
            setState(() {
              selectedImageIndex = p1;
            });
          },
        ),
      ],
    );
  }
}
