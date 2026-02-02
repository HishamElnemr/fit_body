import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/utils/app_styles.dart';
import 'package:fb_fitbody/features/search/presentation/cubit/search_for_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23, bottom: 4),
      child: GestureDetector(
        onTap: () {
          context.read<SearchForProductCubit>().searchForProducts(query: text);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: AppStyles.body2Medium14(context)),
            SvgPicture.asset(Assets.assetsImagesSend),
          ],
        ),
      ),
    );
  }
}
