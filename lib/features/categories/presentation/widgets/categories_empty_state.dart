import 'package:flutter/material.dart';

class CategoriesEmptyState extends StatelessWidget {
  const CategoriesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No categories found'));
  }
}
