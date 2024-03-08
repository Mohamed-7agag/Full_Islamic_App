import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextAndImageSection extends StatelessWidget {
  const TextAndImageSection({super.key, required this.object});
  final Map<String, dynamic> object;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          object['personName'],
          style: Styles.textStyle25.copyWith(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 25.h),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            width: MediaQuery.of(context).size.width - 70,
            height: 350.h,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 0.085),
                borderRadius: BorderRadius.circular(18.r)),
            child: Image.asset(
              "assets/images/music.png",
            )),
        SizedBox(height: 20.h),
        Text(
          "سورة ${object['surahName']}",
          style: Styles.textStyle25,
        ),
      ],
    );
  }
}
