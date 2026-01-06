import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/core/utils/app_validators.dart';
import 'package:fb_fitbody/core/widgets/custom_button.dart';
import 'package:fb_fitbody/core/widgets/custom_outlined_button.dart';
import 'package:fb_fitbody/core/widgets/custom_password_text_field.dart';
import 'package:fb_fitbody/core/widgets/custom_text_field.dart';
import 'package:fb_fitbody/features/auth/data/models/login_request_body.dart';
import 'package:fb_fitbody/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fb_fitbody/features/auth/presentation/widgets/custom_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomLabel(text: 'Email'),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _emailController,
            validator: AppValidators.validateEmail,
            hintText: 'email@example.com',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          const CustomLabel(text: 'Password'),
          const SizedBox(height: 8),
          CustomPasswordTextField(
            controller: _passwordController,
            validator: AppValidators.validatePassword,
            hintText: 'Enter your password',
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password ?',
              style: AppStyles.body2Medium14(
                context,
              ).copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(height: 24),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is LoginLoading,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                      LoginRequestBody(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  }
                },
                text: 'Login',
              );
            },
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: CustomOutlinedButton(
              text: 'Login with Google',
              onPressed: () {},
              icon: SvgPicture.asset(Assets.assetsImagesGoogle),
            ),
          ),
        ],
      ),
    );
  }
}
