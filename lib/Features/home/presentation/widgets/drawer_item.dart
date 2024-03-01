import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.text, required this.path});
  final String text;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: Styles.textStyle18,
        ),
        SizedBox(width: 15.w),
        Image.asset(
          path,
          width: 24.w,
        ),
      ],
    );
  }
}
