import 'package:fb_fitbody/core/widgets/custom_cached_network_image.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/image_thumbnail_list.dart';
import 'package:flutter/material.dart';

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
