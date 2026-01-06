import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutesName.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SvgPicture.asset(Assets.assetsImagesIcon),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'uickMart',
                style: AppStyles.heading1Bold32(
                  context,
                ).copyWith(fontSize: 35, fontWeight: FontWeight.w800),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  'Asia’s No 1 Ecommerce App',
                  style: AppStyles.button2SemiBold14(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
