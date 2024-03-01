import 'package:advanced_quran_app/Core/models/allah_names_model.dart';
import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';

class AllahNamesItem extends StatelessWidget {
  const AllahNamesItem({super.key, required this.allahNamesModel});
  final AllahNamesModel allahNamesModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.h),
            //height: 85.h,
            decoration: BoxDecoration(
              color: kShadeWhite,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Text(
                  "${allahNamesModel.text}",
                  textDirection: TextDirection.rtl,
                  style: Styles.textStyle18,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: () {
                      Share.share(
                          "${allahNamesModel.name}\n${allahNamesModel.text}");
                    },
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          height: 80.h,
          width: 80.w,
          decoration: BoxDecoration(
            color: kShadeWhite,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Text(
            "${allahNamesModel.name}",
            style: Styles.textStyle18,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
