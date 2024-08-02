import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/routes.dart';
import 'package:advanced_quran_app/Features/home/presentation/widgets/date_and_time_section.dart';
import 'package:advanced_quran_app/Features/home/presentation/widgets/home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_prayer_timing_section.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: SvgPicture.asset(
                        "assets/images/drawer.svg",
                        width: 33.w,
                      ),
                    ),
                    Text(
                      "الرفيق",
                      style: GoogleFonts.blakaHollow(
                          fontSize: 30.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: const DateAndTimeSection(),
              ),
              SizedBox(height: 35.h),
              const HomePrayerTimingSection(),
              const Divider(
                height: 44,
                indent: 105,
                endIndent: 105,
                color: kShadeWhite,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: HomeItem(
                              text: "المسبحة\nالاكترونية",
                              destinationRoute: Routes.sibhaViewRoute,
                              icon: Image.asset(
                                "assets/images/tasbih.png",
                                width: 52.w,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: HomeItem(
                              text: "أذكار\nالمسلم",
                              destinationRoute: Routes.azkarCategoryViewRoute,
                              icon: Image.asset(
                                "assets/images/pray.png",
                                width: 42.w,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: HomeItem(
                              text: "القرآن\nالكريم",
                              icon: Image.asset(
                                "assets/images/quran.png",
                                width: 42.w,
                              ),
                              destinationRoute: Routes.quranCategoryViewRoute,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: HomeItem(
                              text: "اتجاة\nالقبلة",
                              destinationRoute: Routes.compassViewRoute,
                              icon: Image.asset(
                                "assets/images/qibla.png",
                                width: 47.w,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: HomeItem(
                              text: "اسماء الله\nالحسني",
                              destinationRoute: Routes.allahNamesViewRoute,
                              icon: Image.asset(
                                "assets/images/99(2).png",
                                width: 46.w,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: HomeItem(
                              text: "منوعات\nاسلامية",
                              destinationRoute: Routes.categoriesViewRoute,
                              icon: Image.asset(
                                "assets/images/menu.png",
                                width: 40.w,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ],
    );
  }
}
