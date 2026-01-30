import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SearchResultTextField extends StatelessWidget {
  const SearchResultTextField({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  final TextEditingController controller;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: (value) {
        onSearch();
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a search term';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: AppStyles.captionRegular12(
          context,
        ).copyWith(color: AppColors.darkGrey150),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        isDense: true,
      ),
      style: TextStyle(
        fontSize: 14,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
