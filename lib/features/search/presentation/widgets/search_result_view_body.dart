import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultViewBody extends StatelessWidget {
  const SearchResultViewBody({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Form(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    // Back icon (leading)
                    GestureDetector(
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
                    ),
                    const SizedBox(width: 16),
                    // Display the search query
                    Expanded(
                      child: Text(
                        query,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Search icon
                    GestureDetector(
                      onTap: () {
                        // Handle search action
                      },
                      child: SvgPicture.asset(
                        Assets.assetsImagesSearchNormal,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onSecondary,
                          BlendMode.srcIn,
                        ),
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Filter icon
                    GestureDetector(
                      onTap: () {
                        // Handle filter action
                      },
                      child: SvgPicture.asset(
                        Assets.assetsImagesFilter,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onSecondary,
                          BlendMode.srcIn,
                        ),
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Add more slivers here for the search results content
      ],
    );
  }
}
