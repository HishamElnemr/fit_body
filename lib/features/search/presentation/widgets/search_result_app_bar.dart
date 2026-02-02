import 'package:fb_fitbody/core/utils/app_images.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/filter_icon_button.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/search_icon_button.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/search_result_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultAppBar extends StatelessWidget {
  const SearchResultAppBar({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.formKey,
  });

  final TextEditingController controller;
  final VoidCallback onSearch;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 70,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
      ),
      title: Form(
        key: formKey,
        child: Row(
          children: [
            _BackButton(),
            const SizedBox(width: 16),
            Expanded(
              child: SearchResultTextField(
                controller: controller,
                onSearch: onSearch,
              ),
            ),
            const SizedBox(width: 16),
            searchIconButton(onTap: onSearch),
            const SizedBox(width: 16),
            const FilterIconButton(),
          ],
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: SvgPicture.asset(
        Assets.assetsImagesArrowLeft,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onSecondary,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
      ),
    );
  }
}
