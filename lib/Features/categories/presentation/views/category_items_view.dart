import 'package:flutter/material.dart';
import '../widgets/category_items_view_body.dart';

class CategoryItemsView extends StatelessWidget {
  const CategoryItemsView({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CategoryItemsViewBody(
        text: text,
      )),
    );
  }
}
