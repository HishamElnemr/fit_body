import 'package:fb_fitbody/features/home/presentation/widgets/category_details_box.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.onTertiary),
      ),
      child: const CategoryDetailsBox(),
    );
  }
}
