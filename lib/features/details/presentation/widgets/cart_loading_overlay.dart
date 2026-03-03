import 'package:flutter/material.dart';

class CartLoadingOverlay extends StatelessWidget {
  const CartLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      color: Colors.black.withOpacity(0.05),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}
