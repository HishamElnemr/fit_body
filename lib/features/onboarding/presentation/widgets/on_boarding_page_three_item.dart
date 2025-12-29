import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_filled_button.dart';
import 'package:fb_fitbody/core/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPageThreeItem extends StatelessWidget {
  const OnBoardingPageThreeItem({super.key, required this.onPressed});
  final void Function()? onPressed;
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: onPressed,
                          icon: SvgPicture.asset(
                            Assets.assetsImagesArrowLeft,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox(height: 45)),
                    Image.asset(
                      Assets.assetsImages03OnlineShopping,
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
                Text(
                  'Safe and secure payments',
                  style: AppStyles.heading2Bold24(context),
                ),
                const SizedBox(height: kHorizontalPadding),
                Text(
                  textAlign: TextAlign.center,
                  'QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.',
                  style: AppStyles.body1Regular16(
                    context,
                  ).copyWith(color: AppColors.lightGrey150),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                        text: 'Login',
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.login);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomFilledButton(
                        text: 'Get Started',
                        icon: const Icon(Icons.arrow_forward, size: 20),
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.signUp);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
