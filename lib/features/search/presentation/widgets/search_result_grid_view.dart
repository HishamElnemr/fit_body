import 'package:fb_fitbody/core/widgets/product_widget.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';

class SearchResultGridView extends StatelessWidget {
  const SearchResultGridView({super.key, required this.products});
  final List<ProductDetailsEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductWidget(productDetailsEntity: products[index]);
        },
      ),
    );
  }
}
