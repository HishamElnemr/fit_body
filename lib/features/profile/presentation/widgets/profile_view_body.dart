import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/theme/cubit/change_theme_cubit.dart';
import 'package:fb_fitbody/core/theme/cubit/change_theme_state.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/features/auth/domain/entities/user_entity.dart';
import 'package:fb_fitbody/features/profile/presentation/widgets/profile_menu_row.dart';
import 'package:fb_fitbody/features/profile/presentation/widgets/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, this.user});

  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isDarkTheme =
        context.watch<ChangeThemeCubit>().state is ChangeThemeToDark;
    final String displayName = user != null && user!.name.trim().isNotEmpty
        ? user!.name.trim()
        : 'Guest User';
    final String displayEmail = user != null && user!.email.trim().isNotEmpty
        ? user!.email.trim()
        : 'guest@quickmart.app';

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cyan,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorScheme.onTertiary),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: AppStyles.captionSemiBold12(
                    context,
                  ).copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  displayName,
                  style: AppStyles.heading2Bold24(
                    context,
                  ).copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 2),
                Text(
                  displayEmail,
                  style: AppStyles.body2Regular14(
                    context,
                  ).copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const ProfileSection(
            title: 'Account',
            rows: [
              ProfileMenuRow(
                title: 'Shipping Address',
                iconPath: Assets.assetsImagesShippingAddress,
              ),
              ProfileMenuRow(
                title: 'Payment Method',
                iconPath: Assets.assetsImagesPaymentMethod,
              ),
              ProfileMenuRow(
                title: 'Order History',
                iconPath: Assets.assetsImagesOrderHistory,
              ),
              ProfileMenuRow(
                title: 'Change Password',
                iconPath: Assets.assetsImagesChangePassword,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ProfileSection(
            title: 'Preferences',
            rows: [
              ProfileMenuRow(
                title: 'Dark Theme',
                iconPath: Assets.assetsImagesDarkTheme,
                showTrailingArrow: false,
                trailing: Switch.adaptive(
                  value: isDarkTheme,
                  onChanged: (_) {
                    context.read<ChangeThemeCubit>().toggleTheme();
                  },
                  activeColor: AppColors.cyan,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const ProfileSection(
            title: 'Support',
            rows: [
              ProfileMenuRow(
                title: 'Privacy Policy',
                iconPath: Assets.assetsImagesPrivacyPolicy,
              ),
              ProfileMenuRow(
                title: 'Terms & Conditions',
                iconPath: Assets.assetsImagesTermsConditions,
              ),
              ProfileMenuRow(title: 'FAQs', iconPath: Assets.assetsImagesFAQs),
            ],
          ),
          const SizedBox(height: 20),
          const ProfileSection(
            title: 'Session',
            rows: [
              ProfileMenuRow(
                title: 'Log Out',
                iconPath: Assets.assetsImagesLogout,
                isDestructive: true,
                trailing: SizedBox.shrink(),
                showTrailingArrow: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
