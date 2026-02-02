import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/theme/cubit/change_theme_cubit.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_button.dart';
import 'package:fb_fitbody/features/search/presentation/cubit/search_for_product_cubit.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/filter_option.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/filter_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  FilterOption _selectedOption = FilterOption.none;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryFixed,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text('Filter', style: AppStyles.body1Medium16(context)),
            const SizedBox(height: 16),
            FilterOptionItem(
              text: 'Price (Low to High)',
              isSelected: _selectedOption == FilterOption.priceLowToHigh,
              onTap: () => _selectOption(FilterOption.priceLowToHigh),
            ),
            FilterOptionItem(
              text: 'Price (High to Low)',
              isSelected: _selectedOption == FilterOption.priceHighToLow,
              onTap: () => _selectOption(FilterOption.priceHighToLow),
            ),
            FilterOptionItem(
              text: 'Discount',
              isSelected: _selectedOption == FilterOption.discount,
              onTap: () => _selectOption(FilterOption.discount),
            ),
            FilterOptionItem(
              text: 'Rating',
              isSelected: _selectedOption == FilterOption.rating,
              onTap: () => _selectOption(FilterOption.rating),
            ),
            const SizedBox(height: 24),
            CustomButton(text: 'Apply', onPressed: _applyFilter),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _selectOption(FilterOption option) {
    setState(() {
      _selectedOption = _selectedOption == option ? FilterOption.none : option;
    });
  }

  void _applyFilter() {
    final cubit = context.read<SearchForProductCubit>();

    String? sortBy;
    String? order;

    switch (_selectedOption) {
      case FilterOption.priceLowToHigh:
        sortBy = 'price';
        order = 'asc';
        break;
      case FilterOption.priceHighToLow:
        sortBy = 'price';
        order = 'desc';
        break;
      case FilterOption.discount:
        sortBy = 'discountPercentage';
        order = 'desc';
        break;
      case FilterOption.rating:
        sortBy = 'rating';
        order = 'desc';
        break;
      case FilterOption.none:
        break;
    }

    cubit.searchForProducts(
      query: cubit.currentQuery,
      sortBy: sortBy,
      order: order,
    );
    context.read<ChangeThemeCubit>().toggleTheme();
    Navigator.pop(context);
  }
}
