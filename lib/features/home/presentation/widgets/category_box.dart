import 'package:fb_fitbody/features/home/presentation/widgets/category_details_box.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
    this.emoji = '📱',
    this.title = 'Electronics',
    this.onTap,
  });

  final String emoji;
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).colorScheme.onTertiary),
        ),
        child: CategoryDetailsBox(emoji: emoji, title: title),
      ),
    );
  }
}
