import 'package:fb_fitbody/features/home/presentation/widgets/category_box.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}
