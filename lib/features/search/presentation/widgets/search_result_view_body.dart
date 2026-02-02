import 'package:fb_fitbody/features/search/presentation/cubit/search_for_product_cubit.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/search_result_app_bar.dart';
import 'package:fb_fitbody/features/search/presentation/widgets/search_results_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultViewBody extends StatefulWidget {
  const SearchResultViewBody({super.key, required this.query});

  final String query;

  @override
  State<SearchResultViewBody> createState() => _SearchResultViewBodyState();
}

class _SearchResultViewBodyState extends State<SearchResultViewBody> {
  late final TextEditingController _controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.query);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SearchResultAppBar(
          controller: _controller,
          onSearch: _search,
          formKey: _formKey,
          
        ),
        const SearchResultsContent(),
      ],
    );
  }

  void _search() {
    if (_formKey.currentState!.validate()) {
      context.read<SearchForProductCubit>().searchForProducts(
        query: _controller.text,
        
      );
    }
  }
}
