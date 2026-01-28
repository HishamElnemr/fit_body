import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/theme/cubit/change_theme_cubit.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_button.dart';
import 'package:fb_fitbody/core/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text('Filter', style: AppStyles.body1Medium16(context)),
            const SizedBox(height: 16),

            CustomCheckbox(text: 'New', onChanged: (value) {}),
            CustomCheckbox(text: 'New', onChanged: (value) {}),
            CustomCheckbox(text: 'New', onChanged: (value) {}),

            const Spacer(),
            CustomButton(
              text: 'Apply',
              onPressed: () {
                context.read<ChangeThemeCubit>().toggleTheme();
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
