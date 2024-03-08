import 'package:advanced_quran_app/Core/utils/app_router.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/azkar_details/presentation/widgets/azkar_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AzkarCategoryViewBody extends StatelessWidget {
  const AzkarCategoryViewBody({super.key});

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
                )),
            title: Text("أذكار المسلم", style: Styles.textStyle23),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 21.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60.h),
                AzkarCategoryItem(
                  text: "أذكار الصباح",
                  imagePath: "assets/images/sun.png",
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.azkarDetailsRoute,
                        arguments: {
                          "text": "أذكار الصباح",
                          "path": "assets/json/azkar_sabah.json"
                        });
                  },
                ),
                SizedBox(height: 12.h),
                AzkarCategoryItem(
                  text: "أذكار المساء",
                  imagePath: "assets/images/moon.png",
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.azkarDetailsRoute,
                        arguments: {
                          "text": "أذكار المساء",
                          "path": "assets/json/azkar_masaa.json"
                        });
                  },
                ),
                SizedBox(height: 12.h),
                AzkarCategoryItem(
                  text: "أذكار الصلاة",
                  imagePath: "assets/images/salah.png",
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.azkarDetailsRoute,
                        arguments: {
                          "text": "أذكار الصلاة",
                          "path": "assets/json/after_salah.json"
                        });
                  },
                ),
                SizedBox(height: 12.h),
                AzkarCategoryItem(
                  text: "أذكار النوم",
                  imagePath: "assets/images/noom.png",
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.azkarDetailsRoute,
                        arguments: {
                          "text": "أذكار النوم",
                          "path": "assets/json/azkar_noom.json"
                        });
                  },
                ),
                SizedBox(height: 12.h),
                AzkarCategoryItem(
                  text: "أذكار الاستيقاظ",
                  imagePath: "assets/images/sunn.png",
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.azkarDetailsRoute,
                        arguments: {
                          "text": "أذكار الاستيقاظ",
                          "path": "assets/json/azkar_astikaz.json"
                        });
                  },
                ),
                SizedBox(height: 12.h),
                AzkarCategoryItem(
                  text: "أذكار مختارة",
                  imagePath: "assets/images/star.png",
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.azkarDetailsRoute,
                        arguments: {
                          "text": "أذكار مختارة",
                          "path": "assets/json/other_azkar.json"
                        });
                  },
                ),
                SizedBox(height: 12.h),
                AzkarCategoryItem(
                  text: "تسابيح",
                  imagePath: "assets/images/prayer-rug.png",
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.azkarDetailsRoute,
                        arguments: {
                          "text": "تسابيح",
                          "path": "assets/json/tsabeeh.json"
                        });
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
