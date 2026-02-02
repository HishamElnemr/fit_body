import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/features/search/presentation/cubit/search_for_product_cubit.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterIconButton extends StatelessWidget {
  const FilterIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchForProductCubit>();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          barrierColor: Theme.of(
            context,
          ).colorScheme.onSecondary.withValues(alpha: 0.6),
          isScrollControlled: true,
          elevation: 5,
          context: context,
          builder: (context) {
            return BlocProvider.value(
              value: searchCubit,
              child: const CustomBottomSheet(),
            );
          },
        );
      },
      child: SvgPicture.asset(
        Assets.assetsImagesFilter,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onSecondary,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
      ),
    );
  }
}
