import 'package:fb_fitbody/features/details/presentation/cubit/quantity_cubit.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/product_details_widget.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuantityCubitProvider extends StatelessWidget {
  const QuantityCubitProvider({
    super.key,
    required this.arguments,
  });

  final ProductDetailsEntity arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuantityCubit(),
      child: ProductDetailsWidget(arguments: arguments),
    );
  }
}
