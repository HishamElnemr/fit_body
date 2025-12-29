import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  final String text;
  final VoidCallback onPressed;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 21),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        side: BorderSide(
          color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.2),
          width: 1,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppStyles.button2SemiBold14(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          if (icon != null) ...[const SizedBox(width: 8), icon!],
        ],
      ),
    );
  }
}
