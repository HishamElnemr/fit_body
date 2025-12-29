import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    required this.controller,
    this.hintText,
    required this.validator,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?) validator;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppStyles.captionRegular12(context),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 23,
          horizontal: 16,
        ),
        suffixIcon: IconButton(
          onPressed: _togglePasswordVisibility,
          icon: SvgPicture.asset(
            _obscureText ? Assets.assetsImagesEyeSlash : Assets.assetsImagesEye,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
