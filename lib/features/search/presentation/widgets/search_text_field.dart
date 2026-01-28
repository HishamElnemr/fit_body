import 'dart:developer';

import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/features/search/presentation/cubit/search_for_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController _controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        onFieldSubmitted: (value) {
          _search(context);
        },
        controller: _controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a search term';
          }
          return null;
        },
        decoration: textFieldDecoration(context),
      ),
    );
  }

  InputDecoration textFieldDecoration(BuildContext context) {
    return InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
          child: GestureDetector(
            onTap: () {
              _search(context);
            },
            child: SvgPicture.asset(
              Assets.assetsImagesSearchNormal,
              colorFilter: const ColorFilter.mode(
                AppColors.darkGrey150,
                BlendMode.srcIn,
              ),
              width: 25,
              height: 25,
            ),
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.assetsImagesFilter,
              colorFilter: const ColorFilter.mode(
                AppColors.darkGrey150,
                BlendMode.srcIn,
              ),
              width: 25,
              height: 25,
            ),
          ),
        ),
        hintText: 'Search',
        hintStyle: AppStyles.captionRegular12(
          context,
        ).copyWith(color: AppColors.darkGrey150),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
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
      );
  }

  void _search(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SearchForProductCubit>().searchForProducts(
        query: _controller.text,
      );
      log('Search Query: ${_controller.text}');
    }
  }
}
