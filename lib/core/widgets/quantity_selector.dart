import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({
    super.key,
    required this.stockQuantity,
    required this.userSelectedQuantity,
    required this.onChanged,
  });
  final int stockQuantity;
  final int userSelectedQuantity;
  final ValueChanged<int> onChanged;
  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int selectedQuantity;

  @override
  void initState() {
    super.initState();
    selectedQuantity = widget.userSelectedQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.onTertiary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (selectedQuantity > 1) {
                      selectedQuantity--;
                      widget.onChanged.call(selectedQuantity);
                    }
                  });
                },
                icon: const Icon(Icons.remove),
              ),
              Text(selectedQuantity.toString()),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (selectedQuantity < widget.stockQuantity) {
                      selectedQuantity++;
                      widget.onChanged.call(selectedQuantity);
                    }
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
