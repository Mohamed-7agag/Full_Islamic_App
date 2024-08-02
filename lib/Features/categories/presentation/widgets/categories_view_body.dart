import 'package:advanced_quran_app/Core/utils/routes.dart';
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
                      Navigator.pushNamed(context, Routes.favouriteViewRoute);
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
              Row(
                children: [
                  Expanded(
                    child: CategoriesViewItem(
                      text: "السيرة النبوية",
                      image:
                          Image.asset("assets/images/mohamed.png", width: 65),
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.categoriesListViewRoute,
                            arguments: {
                              "text": "السيرة النبوية",
                              "items": sira
                            });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: CategoriesViewItem(
                      text: "قصص أسلامية",
                      image: Image.asset(
                          "assets/images/crescent-moon_4354860.png",
                          width: 65),
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.categoriesListViewRoute,
                            arguments: {
                              "text": "قصص أسلامية",
                              "items": islamStories
                            });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CategoriesViewItem(
                      text: "الحج و العمرة",
                      image: Image.asset("assets/images/haj.png", width: 65),
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.categoriesListViewRoute,
                            arguments: {"text": "الحج و العمرة", "items": haj});
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CategoriesViewItem(
                      text: "أسلاميات",
                      image: Image.asset("assets/images/hand_4355994.png",
                          width: 65),
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.categoriesListViewRoute,
                            arguments: {"text": "أسلاميات", "items": islamyat});
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CategoriesViewItem(
                      text: "أدعية",
                      image: Image.asset("assets/images/hands.png", width: 65),
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.categoriesListViewRoute,
                            arguments: {"text": "أدعية", "items": doaa});
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CategoriesViewItem(
                      text: "أحاديث",
                      image:
                          Image.asset("assets/images/pattern.png", width: 65),
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.categoriesListViewRoute,
                            arguments: {"text": "أحاديث", "items": ahadith});
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
