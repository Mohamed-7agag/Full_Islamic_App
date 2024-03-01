// ignore_for_file: use_build_context_synchronously
import 'package:advanced_quran_app/Core/utils/app_router.dart';
import 'package:advanced_quran_app/Features/home/presentation/widgets/date_and_time_section.dart';
import 'package:advanced_quran_app/Features/home/presentation/widgets/home_item.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/background3.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 6.w),
                      child: InkWell(
                          onTap: () async {
                            if (await CacheHelper.containsKey(key: "mark")) {
                              Navigator.pushNamed(
                                  context, AppRouter.quranViewRoute,
                                  arguments: CacheHelper.getData(key: "mark"));
                            } else {
                              Navigator.pushNamed(
                                  context, AppRouter.quranViewRoute,
                                  arguments: 0);
                            }
                          },
                          child: Image.asset(
                            "assets/images/bookmark.png",
                            width: 20.w,
                            height: 45.h,
                            fit: BoxFit.fitHeight,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Text(
                        "الرفيق",
                        style: GoogleFonts.blakaHollow(
                            fontSize: 30.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                const DateAndTimeSection(),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeItem(
                      text: "أذكار\nالمسلم",
                      onpressed: () {
                        Navigator.pushNamed(
                            context, AppRouter.azkarCategoryViewRoute);
                      },
                      icon: Image.asset(
                        "assets/images/pray.png",
                        width: 42.w,
                      ),
                    ),
                    HomeItem(
                      text: "مواقيت\nالصلاة",
                      onpressed: () {
                        Navigator.pushNamed(context, AppRouter.prayerViewRoute);
                      },
                      icon: Image.asset(
                        "assets/images/mosque(2).png",
                        width: 45.w,
                      ),
                    ),
                    HomeItem(
                      text: "القرآن\nالكريم",
                      icon: Image.asset(
                        "assets/images/quran.png",
                        width: 42.w,
                      ),
                      onpressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRouter.quranCategoryViewRoute,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeItem(
                      text: "رمضان",
                      icon: Image.asset(
                        "assets/images/ramadan2.png",
                        width: 48.w,
                      ),
                    ),
                    HomeItem(
                      text: "المسبحة",
                      onpressed: () {
                        Navigator.pushNamed(context, AppRouter.sibhaViewRoute);
                      },
                      icon: Image.asset(
                        "assets/images/sibha.png",
                        width: 52.w,
                      ),
                    ),
                    HomeItem(
                      text: "منوعات\nاسلامية",
                      onpressed: () {
                        Navigator.pushNamed(
                            context, AppRouter.categoriesViewRoute);
                      },
                      icon: Image.asset(
                        "assets/images/menu.png",
                        width: 40.w,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeItem(
                      text: "الاعدادات",
                      onpressed: () {},
                      icon: Image.asset(
                        "assets/images/process.png",
                        width: 55.w,
                      ),
                    ),
                    HomeItem(
                      text: "اسماء الله\nالحسني",
                      onpressed: () {
                        Navigator.pushNamed(
                            context, AppRouter.allahNamesViewRoute);
                      },
                      icon: Image.asset(
                        "assets/images/99(2).png",
                        width: 46.w,
                      ),
                    ),
                    HomeItem(
                      text: "اتجاة\nالقبلة",
                      onpressed: () {
                        Navigator.pushNamed(
                            context, AppRouter.compassViewRoute);
                      },
                      icon: Image.asset(
                        "assets/images/qibla.png",
                        width: 47.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
