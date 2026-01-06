import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fb_fitbody/features/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupFormBlocListener extends StatelessWidget {
  const SignupFormBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.authResponseEntity.message)),
          );
          Navigator.pushNamed(context, RoutesName.home);
        } else if (state is SignupError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else {
          const SizedBox.shrink();
        }
      },
      child: const SignUpForm(),
    );
  }
}
