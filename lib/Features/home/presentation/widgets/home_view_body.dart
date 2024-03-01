// ignore_for_file: use_build_context_synchronously
import 'package:advanced_quran_app/Core/utils/app_router.dart';
import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/custom_loading_widget.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/home/presentation/widgets/date_and_time_section.dart';
import 'package:advanced_quran_app/Features/home/presentation/widgets/home_item.dart';
import 'package:advanced_quran_app/Features/home/presentation/widgets/home_prayer_item.dart';
import 'package:advanced_quran_app/Features/quran/data/local_data.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Core/utils/custom_error_widget.dart';
import '../../../prayer/presentation/view_model/prayer_cubit/prayer_cubit.dart';

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
                padding: EdgeInsets.only(left: 15.w, right: 15.w,top: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(left: 6.w),
                    //   child: InkWell(
                    //       onTap: () async {
                    //         if (await CacheHelper.containsKey(key: "mark")) {
                    //           Navigator.pushNamed(
                    //               context, AppRouter.quranViewRoute,
                    //               arguments: CacheHelper.getData(key: "mark"));
                    //         } else {
                    //           Navigator.pushNamed(
                    //               context, AppRouter.quranViewRoute,
                    //               arguments: 0);
                    //         }
                    //       },
                    //       child: Image.asset(
                    //         "assets/images/bookmark.png",
                    //         width: 20.w,
                    //         height: 45.h,
                    //         fit: BoxFit.fitHeight,
                    //       )),
                    // ),
                    Image.asset("assets/images/drawer.png",width: 33.w,),
                    Text(
                      "الرفيق",
                      style: GoogleFonts.blakaHollow(
                          fontSize: 30.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: const DateAndTimeSection(),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("مواقيت الصلاة", style: Styles.textStyle20)),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: SizedBox(
                  height: 90.h,
                  child: BlocBuilder<PrayerCubit, PrayerState>(
                    builder: (context, state) {
                      if (state is PrayerSuccess) {
                        List<String> prayerlist = [
                          state.prayerModel.data!.timings!.fajr!,
                          state.prayerModel.data!.timings!.dhuhr!,
                          state.prayerModel.data!.timings!.asr!,
                          state.prayerModel.data!.timings!.maghrib!,
                          state.prayerModel.data!.timings!.isha!,
                        ];
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: HomePrayerItem(
                                imagePath: prayerImagePath[index],
                                prayerTiming: prayerTiming[index],
                                time: prayerlist[index],
                              ),
                            );
                          },
                        );
                      } else if (state is PrayerFailure) {
                        return CustomErrorWidget(errMessage: state.errMessage);
                      }
                      return const CustomLoadingWidget();
                    },
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ],
    );
  }
}
