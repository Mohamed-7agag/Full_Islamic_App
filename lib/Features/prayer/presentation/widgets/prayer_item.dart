import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerItem extends StatelessWidget {
  const PrayerItem(
      {super.key,
      required this.text,
      required this.time,
      required this.imagePath});
  final String text;
  final String time;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      width: double.infinity,
      height: 65.h,
      decoration: BoxDecoration(
          color: kShadeWhite, borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imagePath,
            width: 36.w,
          ),
          Text(
            time,
            style: Styles.textStyle20,
          ),
          Text(
            text,
            style: Styles.textStyle20,
          )
        ],
      ),
    );
  }
}
