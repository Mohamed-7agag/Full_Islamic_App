import 'package:advanced_quran_app/Core/utils/app_router.dart';
import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/categories/data/models/categories_model1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemsViewItem extends StatelessWidget {
  const CategoryItemsViewItem({super.key, required this.categoriesModel1});
  final CategoriesModel1 categoriesModel1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.textViewRoute,
            arguments: categoriesModel1);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        width: double.infinity,
        height: 68.h,
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
                categoriesModel1.number!,
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
