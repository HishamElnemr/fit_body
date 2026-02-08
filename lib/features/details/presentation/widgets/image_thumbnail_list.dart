import 'package:fb_fitbody/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageThumbnailList extends StatelessWidget {
  final List<String> images;
  final int selectedIndex;
  final Function(int) onImageSelected;
  const ImageThumbnailList({
    super.key,
    required this.images,
    required this.selectedIndex,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(images.length, (index) {
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () => onImageSelected(index),
                child: Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? Theme.of(context).colorScheme.onTertiary
                          : Colors.transparent,
                      width: 2,
                    ),

                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomCachedNetworkImage(imageUrl: images[index]),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
