import 'package:flutter/material.dart';

import '../widgets/quran_category_view_body.dart';

class QuranCategoryView extends StatelessWidget {
  const QuranCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: QuranCategoryViewBody(),
      ),
    );
  }
}
