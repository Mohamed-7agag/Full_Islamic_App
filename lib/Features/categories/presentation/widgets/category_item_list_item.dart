import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/constants.dart';
import '../../../../Core/utils/styles.dart';

class CategoryItemListItem extends StatelessWidget {
  const CategoryItemListItem(
      {super.key, required this.text, this.onTap});
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r), color: kShadeWhite),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
