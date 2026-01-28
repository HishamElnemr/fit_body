import 'package:fb_fitbody/features/search/presentation/widgets/search_result_view_body.dart';
import 'package:flutter/material.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final String query =
        ModalRoute.of(context)?.settings.arguments as String? ?? '';
    return Scaffold(
      body: SafeArea(child: SearchResultViewBody(query: query)),
    );
  }
}
