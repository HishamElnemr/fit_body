import 'package:fb_fitbody/core/widgets/page_title_app_bar.dart';
import 'package:fb_fitbody/features/product/presentation/cubit/hive_cubit.dart';
import 'package:fb_fitbody/features/wishlist/presentation/widgets/wishlist_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
    context.read<HiveCubit>().loadWishlistProducts();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PageTitleAppBar(title: 'Wishlist'),
      body: SafeArea(child: WishlistViewBody()),
    );
  }
}
