import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/widgets/custom_logo_widget.dart';
import 'package:fb_fitbody/features/auth/presentation/widgets/login_form_bloc_listener.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomLogoWidget(),
                const SizedBox(height: 24),
                Text('Login', style: AppStyles.heading2Bold24(context)),
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    style: AppStyles.body2Regular14(
                      context,
                    ).copyWith(color: AppColors.darkGrey150),
                    children: [
                      TextSpan(
                        text: 'Signup',
                        style: AppStyles.body2Regular14(
                          context,
                        ).copyWith(color: Theme.of(context).primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, RoutesName.signUp);
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const LoginFormBlocListener(),
                const SizedBox(height: 32),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      text: 'By login , you agree to our',
                      style: AppStyles.captionSemiBold12(context),
                      children: [
                        TextSpan(
                          text: ' Privacy Policy ',
                          style: AppStyles.captionSemiBold12(
                            context,
                          ).copyWith(color: AppColors.blue),
                        ),
                        TextSpan(
                          text: 'and',
                          style: AppStyles.captionSemiBold12(context),
                        ),
                        TextSpan(
                          text: ' Terms & Conditions ',
                          style: AppStyles.captionSemiBold12(
                            context,
                          ).copyWith(color: AppColors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
