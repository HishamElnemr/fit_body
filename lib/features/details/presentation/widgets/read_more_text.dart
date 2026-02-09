import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;

  const ReadMoreText({super.key, required this.text});

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: widget.text,
            style: AppStyles.body2Regular14(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.outline),
          ),
          maxLines: 5,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isTextOverflowing = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: AppStyles.body2Regular14(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.outline),
              maxLines: isExpanded ? null : 5,
              overflow: isExpanded ? null : TextOverflow.ellipsis,
            ),
            if (isTextOverflowing)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    isExpanded ? 'Read Less' : 'Read More',
                    style: AppStyles.body2Regular14(context).copyWith(
                      color: AppColors.cyan,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
