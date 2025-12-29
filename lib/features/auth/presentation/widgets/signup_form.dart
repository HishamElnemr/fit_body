import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_validators.dart';
import 'package:fb_fitbody/core/widgets/custom_button.dart';
import 'package:fb_fitbody/core/widgets/custom_outlined_button.dart';
import 'package:fb_fitbody/core/widgets/custom_password_text_field.dart';
import 'package:fb_fitbody/core/widgets/custom_text_field.dart';
import 'package:fb_fitbody/features/auth/presentation/widgets/custom_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
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
          const CustomLabel(text: 'Full Name'),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _fullNameController,
            validator: AppValidators.validateFullName,
            hintText: 'Enter your full name',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
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
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            text: 'Create Account',
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
