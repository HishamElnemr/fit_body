import 'package:fb_fitbody/core/widgets/page_title_app_bar.dart';
import 'package:fb_fitbody/features/auth/domain/entities/user_entity.dart';
import 'package:fb_fitbody/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, this.user});

  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageTitleAppBar(title: 'Profile'),
      body: SafeArea(child: ProfileViewBody(user: user)),
    );
  }
}
