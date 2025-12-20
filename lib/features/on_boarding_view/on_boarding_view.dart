import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/theme/cubit/change_theme_cubit.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_button.dart';
import 'package:fb_fitbody/core/widgets/custom_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: OnBoardingViewBody()));
  }
}

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: kHorizontalPadding,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomLogoWidget(),
                        Text(
                          'Skip for now',
                          style: AppStyles.body2Medium14(
                            context,
                          ).copyWith(color: AppColors.cyan),
                        ),
                      ],
                    ),
                    const SizedBox(height: 45),
                    Image.asset(
                      Assets.assetsImages01OnlineShopping,
                      width: 240,
                      height: 240,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Explore a wide range of products',
                  style: AppStyles.heading2Bold24(
                    context,
                  ).copyWith(color: AppColors.black),
                ),
                const SizedBox(height: kHorizontalPadding),
                Text(
                  textAlign: TextAlign.center,
                  'Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.',
                  style: AppStyles.body1Regular16(
                    context,
                  ).copyWith(color: AppColors.lightGrey150),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  color: Theme.of(
                    context,
                  ).elevatedButtonTheme.style?.backgroundColor,
                  text: 'Next',
                  onPressed: () {
                    context.read<ChangeThemeCubit>().toggleTheme();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
