import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AzkarCategoryItem extends StatelessWidget {
  const AzkarCategoryItem(
      {super.key,
      required this.text,
      required this.imagePath,
      required this.onTap});
  final String text;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        width: double.infinity,
        height: 68.h,
        decoration: BoxDecoration(
          color: kShadeWhite,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              width: 40.w,
            ),
            Text(
              text,
              style: Styles.textStyle23,
            )
          ],
        ),
      ),
    );
  }
}
