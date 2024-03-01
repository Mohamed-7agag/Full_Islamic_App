import 'package:advanced_quran_app/Features/azkar_details/presentation/widgets/azkar_details_view_body.dart';
import 'package:flutter/material.dart';

class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: AzkarDetailsViewBody(
          text: text,
        ),
      ),
    );
  }
}
