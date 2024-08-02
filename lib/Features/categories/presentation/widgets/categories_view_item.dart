import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/constants.dart';
import '../../../../Core/utils/styles.dart';

class CategoriesViewItem extends StatelessWidget {
  const CategoriesViewItem(
      {super.key, required this.text, this.onTap, this.image});
  final String text;
  final VoidCallback? onTap;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kShadeWhite,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image ?? const SizedBox.shrink(),
              const SizedBox(height: 12),
              Text(
                text,
                style: Styles.textStyle20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
