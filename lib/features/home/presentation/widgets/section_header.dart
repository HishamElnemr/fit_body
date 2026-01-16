import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, required this.seeAll});

  final String title;
  final String seeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppStyles.heading3Bold18(context)),
        const Spacer(),
        Text(
          seeAll,
          style: AppStyles.overlineSemiBold10(
            context,
          ).copyWith(color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}
