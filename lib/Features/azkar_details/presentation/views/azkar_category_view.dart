import 'package:flutter/material.dart';

import '../widgets/azkar_category_view_body.dart';

class AzkarCategoryView extends StatelessWidget {
  const AzkarCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AzkarCategoryViewBody()),
    );
  }
}
