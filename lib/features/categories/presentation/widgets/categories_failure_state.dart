import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CategoriesFailureState extends StatelessWidget {
  const CategoriesFailureState({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(kHorizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(errorMessage, textAlign: TextAlign.center)],
        ),
      ),
    );
  }
}
