import 'package:fb_fitbody/core/widgets/custom_check_box.dart';
import 'package:fb_fitbody/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';

class IsSelectedWidget extends StatefulWidget {
  const IsSelectedWidget({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  State<IsSelectedWidget> createState() => _IsSelectedWidgetState();
}

class _IsSelectedWidgetState extends State<IsSelectedWidget> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return CustomCheckBox(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      isSelected: isSelected,
    );
  }
}
