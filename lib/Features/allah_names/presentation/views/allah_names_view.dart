import 'package:advanced_quran_app/Features/allah_names/presentation/widgets/allah_names_view_body.dart';
import 'package:flutter/material.dart';

class AllahNamesView extends StatelessWidget {
  const AllahNamesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AllahNamesViewBody(),
      ),
    );
  }
}
