import 'package:advanced_quran_app/Features/categories/presentation/widgets/categories_list_view_body.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView(
      {super.key, required this.text, required this.category});
  final String text;
  final List<List<String>> category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CategoriesListViewBody(
        category: category,
        text: text,
      )),
    );
  }
}
