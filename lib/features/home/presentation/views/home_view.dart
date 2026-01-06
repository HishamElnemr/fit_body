import 'package:fb_fitbody/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:fb_fitbody/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomHomeAppBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
