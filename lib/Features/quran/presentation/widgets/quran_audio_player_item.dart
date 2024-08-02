import 'package:advanced_quran_app/Core/utils/routes.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Core/utils/constants.dart';

class QuranAudioPlayerItem extends StatelessWidget {
  const QuranAudioPlayerItem({
    super.key,
    required this.url,
    required this.surahName,
    required this.index,
    required this.personName,
  });
  final String url;
  final String surahName;
  final int index;
  final String personName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.audioViewRoute, arguments: {
          "url": url,
          "surahName": surahName,
          "personName": personName,
        });
      },
      child: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        width: double.infinity,
        height: 65.h,
        decoration: BoxDecoration(
          color: kShadeWhite,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios_new_rounded),
            Row(
              children: [
                Text(
                  "سورة $surahName",
                  style: Styles.textStyle20,
                ),
                SizedBox(width: 10.w),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/ayah.svg",
                      width: 40.w,
                    ),
                    Text(
                      "${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
