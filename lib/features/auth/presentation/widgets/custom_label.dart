import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: AppStyles.body2Medium14(context),
        children: [
          TextSpan(
            text: ' *',
            style: AppStyles.body2Medium14(context).copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
