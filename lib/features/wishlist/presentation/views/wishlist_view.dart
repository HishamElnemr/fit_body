import 'package:fb_fitbody/core/widgets/page_title_app_bar.dart';
import 'package:fb_fitbody/features/wishlist/presentation/widgets/wishlist_view_body.dart';
import 'package:flutter/material.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PageTitleAppBar(title: 'Wishlist'),
      body: SafeArea(child: WishlistViewBody()),
    );
  }
}
