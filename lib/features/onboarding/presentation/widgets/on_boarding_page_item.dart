import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnBoardingPageItem extends StatelessWidget {
  const OnBoardingPageItem({
    super.key,
    required this.leading,
    required this.title,
    required this.description,
    required this.image,
    required this.onPressed,
  });

  final Widget leading;
  final String title;
  final String description;
  final String image;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          Expanded(
            flex: 2,
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
                        leading,
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.signUp);
                          },
                          child: Text(
                            'Skip for now',
                            style: AppStyles.body2Medium14(
                              context,
                            ).copyWith(color: AppColors.cyan),
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox(height: 45)),
                    Image.asset(
                      image,
                      width: 240,
                      height: 240,
                      fit: BoxFit.contain,
                    ),
                    const Expanded(child: SizedBox(height: 15)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title, style: AppStyles.heading2Bold24(context)),
                const SizedBox(height: kHorizontalPadding),
                Text(
                  textAlign: TextAlign.center,
                  description,
                  style: AppStyles.body1Regular16(
                    context,
                  ).copyWith(color: AppColors.lightGrey150),
                ),
                const SizedBox(height: 24),
                CustomButton(text: 'Next', onPressed:onPressed ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
