import 'package:flutter/material.dart';
import '../widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: FavouriteViewBody()),
    );
  }
}
