import 'package:advanced_quran_app/Core/utils/custom_loading_widget.dart';
import 'package:advanced_quran_app/Core/utils/days_difference_function.dart';
import 'package:advanced_quran_app/Core/utils/format_prayer_time_function.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/prayer/presentation/view_model/prayer_cubit/prayer_cubit.dart';
import 'package:advanced_quran_app/Core/utils/custom_error_widget.dart';
import 'package:advanced_quran_app/Features/prayer/presentation/widgets/prayer_item.dart';
import 'package:advanced_quran_app/Features/quran/data/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerViewBody extends StatelessWidget {
  const PrayerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          "assets/images/prayer_background.png",
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
            title: Text("المواقيت", style: Styles.textStyle23),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 56.h, left: 15.w, right: 15.w),
          child: BlocBuilder<PrayerCubit, PrayerState>(
            builder: (context, state) {
              if (state is PrayerSuccess) {
                List<String> list = [
                  formatTime(
                      state.prayerModelList[dayDifference()].timings!.fajr!),
                  formatTime(
                      state.prayerModelList[dayDifference()].timings!.sunrise!),
                  formatTime(
                      state.prayerModelList[dayDifference()].timings!.dhuhr!),
                  formatTime(
                      state.prayerModelList[dayDifference()].timings!.asr!),
                  formatTime(
                      state.prayerModelList[dayDifference()].timings!.maghrib!),
                  formatTime(
                      state.prayerModelList[dayDifference()].timings!.isha!),
                  formatTime(
                      state.prayerModelList[dayDifference()].timings!.imsak!),
                  formatTime(state
                      .prayerModelList[dayDifference()].timings!.midnight!),
                  formatTime(state
                      .prayerModelList[dayDifference()].timings!.firstthird!),
                  formatTime(state
                      .prayerModelList[dayDifference()].timings!.lastthird!),
                ];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.prayerModelList[dayDifference()].date!
                                  .hijri!.date!,
                              style: Styles.textStyle16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "${state.prayerModelList[dayDifference()].date!.hijri!.weekday!.ar!} , ${state.prayerModelList[dayDifference()].date!.hijri!.day} ${state.prayerModelList[dayDifference()].date!.hijri!.month!.ar}",
                                  style: Styles.textStyle16,
                                ),
                                SizedBox(width: 7.w),
                                Image.asset(
                                  "assets/images/calendar.png",
                                  width: 18.w,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      ListView.builder(
                        itemCount: list.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              PrayerItem(
                                imagePath: allPrayerImagePath[index],
                                text: allPrayerTiming[index],
                                time: list[index],
                              ),
                              const SizedBox(height: 12),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else if (state is PrayerFailure) {
                return CustomErrorWidget(errMessage: state.errMessage);
              }
              return const CustomLoadingWidget();
            },
          ),
        ),
      ],
    );
  }
}
