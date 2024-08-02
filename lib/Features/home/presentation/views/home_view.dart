import 'package:advanced_quran_app/Features/home/presentation/widgets/custom_drawer.dart';
import 'package:advanced_quran_app/Features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        child: const CustomDrawer(),
      ),
      body: const SafeArea(child: HomeViewBody()),
    );
  }
}
