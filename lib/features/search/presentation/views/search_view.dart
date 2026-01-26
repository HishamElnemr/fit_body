import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/core/widgets/custom_app_bar.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: Assets.assetsImagesCancel,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: const SafeArea(child: SearchViewBody()),
    );
  }
}
