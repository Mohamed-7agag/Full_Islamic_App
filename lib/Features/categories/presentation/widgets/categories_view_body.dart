import 'package:advanced_quran_app/Core/utils/app_router.dart';
import 'package:advanced_quran_app/Features/categories/data/models/local_data/categories_local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/styles.dart';
import 'categories_view_item.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          "assets/images/background3.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRouter.favouriteViewRoute);
                    },
                    icon: Icon(
                      Icons.favorite_border_rounded,
                      size: 28.sp,
                      color: Colors.white,
                    ))
              ],
              title: Text("منوعات أسلامية", style: Styles.textStyle23),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 70.h),
          child: Column(
            children: [
              CategoriesViewItem(
                text: "السيرة النبوية",
                icon: Image.asset("assets/images/mohamed.png", width: 42.w),
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRouter.categoriesListViewRoute,
                      arguments: {"text": "السيرة النبوية", "items": sira});
                },
              ),
              SizedBox(height: 12.h),
              CategoriesViewItem(
                text: "قصص أسلامية",
                icon: Image.asset("assets/images/crescent-moon_4354860.png",
                    width: 40.w),
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRouter.categoriesListViewRoute, arguments: {
                    "text": "قصص أسلامية",
                    "items": islamStories
                  });
                },
              ),
              SizedBox(height: 12.h),
              CategoriesViewItem(
                text: "الحج و العمرة",
                icon: Image.asset("assets/images/haj.png", width: 40.w),
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRouter.categoriesListViewRoute,
                      arguments: {"text": "الحج و العمرة", "items": haj});
                },
              ),
              SizedBox(height: 12.h),
              CategoriesViewItem(
                text: "أسلاميات",
                icon:
                    Image.asset("assets/images/hand_4355994.png", width: 38.w),
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRouter.categoriesListViewRoute,
                      arguments: {"text": "أسلاميات", "items": islamyat});
                },
              ),
              SizedBox(height: 12.h),
              CategoriesViewItem(
                text: "أدعية",
                icon: Image.asset("assets/images/hands.png", width: 40.w),
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRouter.categoriesListViewRoute,
                      arguments: {"text": "أدعية", "items": doaa});
                },
              ),
              SizedBox(height: 12.h),
              CategoriesViewItem(
                text: "أحاديث",
                icon: Image.asset("assets/images/pattern.png", width: 42.w),
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRouter.categoriesListViewRoute,
                      arguments: {"text": "أحاديث", "items": ahadith});
                },
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ],
    );
  }
}
