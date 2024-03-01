import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SibhaDialogItem extends StatelessWidget {
  const SibhaDialogItem({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h),
        InkWell(
          onTap: onTap,
          child: Text(
            text,
            style: Styles.textStyle20.copyWith(color: Colors.black),
          ),
        ),
        Divider(
          thickness: 0.6,
          color: Colors.grey[200],
        ),
      ],
    );
  }
}
