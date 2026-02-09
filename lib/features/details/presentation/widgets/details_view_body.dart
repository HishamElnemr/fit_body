import 'package:fb_fitbody/features/details/presentation/widgets/details_app_bar.dart';
import 'package:fb_fitbody/features/details/presentation/widgets/product_details_widget.dart';
import 'package:fb_fitbody/features/product/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key});

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  bool isScrolled = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // The threshold should be expandedHeight - collapsedHeight (ToolbarHeight)
    // We used 0.4 * screen height for expanded height.
    final expandedHeight = MediaQuery.sizeOf(context).height * 0.4;
    final collapsedHeight = kToolbarHeight;
    final threshold = expandedHeight - collapsedHeight;

    if (_scrollController.hasClients) {
      if (_scrollController.offset >= threshold && !isScrolled) {
        setState(() => isScrolled = true);
      } else if (_scrollController.offset < threshold && isScrolled) {
        setState(() => isScrolled = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsEntity;
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        DetailsAppBar(arguments: arguments, isScrolled: isScrolled),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(child: ProductDetailsWidget(arguments: arguments)),
      ],
    );
  }
}
