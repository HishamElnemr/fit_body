import 'package:fb_fitbody/core/services/getit_services.dart';
import 'package:fb_fitbody/features/auth/domain/repositories/auth_repo.dart';
import 'package:fb_fitbody/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fb_fitbody/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(getIt<AuthRepo>()),
          child: const LoginViewBody(),
        ),
      ),
    );
  }
}
