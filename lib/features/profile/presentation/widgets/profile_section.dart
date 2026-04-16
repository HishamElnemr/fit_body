import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({required this.title, required this.rows});

  final String title;
  final List<Widget> rows;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.heading3SemiBold18(
            context,
          ).copyWith(color: colorScheme.onSecondary),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: colorScheme.primaryFixed,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme.onTertiary),
          ),
          child: Column(children: _withDividers(context, rows)),
        ),
      ],
    );
  }

  List<Widget> _withDividers(BuildContext context, List<Widget> children) {
    final List<Widget> output = [];
    for (var index = 0; index < children.length; index++) {
      output.add(children[index]);
      if (index != children.length - 1) {
        output.add(
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.onTertiary,
            indent: kHorizontalPadding,
            endIndent: kHorizontalPadding,
          ),
        );
      }
    }
    return output;
  }
}
