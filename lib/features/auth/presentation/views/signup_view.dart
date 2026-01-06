import 'package:fb_fitbody/core/services/getit_services.dart';
import 'package:fb_fitbody/features/auth/domain/repositories/auth_repo.dart';
import 'package:fb_fitbody/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fb_fitbody/features/auth/presentation/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignupCubit(getIt<AuthRepo>()),
          child: const SignUpViewBody(),
        ),
      ),
    );
  }
}
