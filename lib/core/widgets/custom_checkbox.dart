import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key, required this.text, this.onChanged});

  final String text;
  final ValueChanged<bool>? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isActive = !isActive;
                  });
                  widget.onChanged?.call(isActive);
                },
                child: SvgPicture.asset(
                  isActive
                      ? Assets.assetsImagesCheckBoxActive
                      : Assets.assetsImagesCheckBox,
                  width: 32,
                  height: 32,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              const SizedBox(width: 12),
              Text(widget.text, style: AppStyles.body2Medium14(context)),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: Theme.of(context).colorScheme.onTertiary,
          height: 1,
        ),
      ],
    );
  }
}
