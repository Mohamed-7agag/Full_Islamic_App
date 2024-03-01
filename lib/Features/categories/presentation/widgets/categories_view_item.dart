import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/constants.dart';
import '../../../../Core/utils/styles.dart';

class CategoriesViewItem extends StatelessWidget {
  const CategoriesViewItem(
      {super.key, required this.text, this.onTap, this.icon});
  final String text;
  final VoidCallback? onTap;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        width: double.infinity,
        height: 68.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r), color: kShadeWhite),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon ??
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: Styles.textStyle20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
