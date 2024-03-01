import 'package:flutter/material.dart';
import '../widgets/favourite_surah_view_body.dart';

class FavouriteSurahView extends StatelessWidget {
  const FavouriteSurahView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: FavouriteSurahViewBody(),
      ),
    );
  }
}
