import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:flutter/material.dart';

class SibhaButton extends StatelessWidget {
  const SibhaButton({super.key, required this.icon, required this.onPressed});
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          kShadeWhite,
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.all(14)),
      ),
      onPressed: onPressed,
      icon: icon,
    );
  }
}
