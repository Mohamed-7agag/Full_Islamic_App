import 'package:advanced_quran_app/Core/utils/format_prayer_time_function.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/constants.dart';

class HomePrayerItem extends StatelessWidget {
  const HomePrayerItem(
      {super.key,
      required this.prayerTiming,
      required this.imagePath,
      required this.time});
  final String prayerTiming;
  final String imagePath;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      width: 168,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: kShadeWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                imagePath,
                width: 40.w,
              ),
              Text(prayerTiming, style: Styles.textStyle20),
            ],
          ),
          Text(
            formatTime(time),
            style: Styles.textStyle18,
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}
