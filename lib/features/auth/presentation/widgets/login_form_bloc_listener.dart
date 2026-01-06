import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fb_fitbody/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormBlocListener extends StatelessWidget {
  const LoginFormBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.authResponseEntity.message)),
          );
          Navigator.pushNamed(context, RoutesName.home);
        } else if (state is LoginError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else {
          const SizedBox.shrink();
        }
      },
      child: const LoginForm(),
    );
  }
}
