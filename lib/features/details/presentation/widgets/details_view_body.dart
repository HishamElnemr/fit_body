import 'package:fb_fitbody/features/details/presentation/widgets/product_details_widget.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/product_image_stack.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsEntity;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: ProductImageStack(images: arguments.images),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(child: ProductDetailsWidget(arguments: arguments)),
      ],
    );
  }
}
