import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/routes.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/quran/data/local_data.dart';
import 'package:advanced_quran_app/Features/quran/data/models/quran_model/quran_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuranListViewItem extends StatelessWidget {
  const QuranListViewItem({super.key, required this.quranModel});
  final QuranModel quranModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.quranViewRoute,
            arguments: posOfSurah[quranModel.id! - 1]);
      },
      child: Container(
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
            Row(
              children: [
                Text(
                  "${quranModel.array!.length}",
                  style: Styles.textStyle16,
                ),
                const Text(" : عدد الأيات"),
              ],
            ),
            Row(
              children: [
                Text(
                  "${quranModel.name}",
                  style: Styles.textStyle18,
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
                      "${quranModel.id}",
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
