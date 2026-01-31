import 'package:fb_fitbody/features/home/presentation/widgets/category_box.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesSkeleton extends StatelessWidget {
  const CategoriesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      enabled: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: CategoryBox()),
          SizedBox(width: 8),
          Expanded(child: CategoryBox()),
          SizedBox(width: 8),
          Expanded(child: CategoryBox()),
          SizedBox(width: 8),
          Expanded(child: CategoryBox()),
        ],
      ),
    );
  }
}
