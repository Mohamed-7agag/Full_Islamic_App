import 'package:advanced_quran_app/Core/notification/notification_service.dart';
import 'package:advanced_quran_app/Core/notification/work_manager_service.dart';
import 'package:advanced_quran_app/Core/utils/custom_error_widget.dart';
import 'package:advanced_quran_app/Core/utils/custom_loading_widget.dart';
import 'package:advanced_quran_app/Core/utils/days_difference_function.dart';
import 'package:advanced_quran_app/Core/utils/routes.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/home/presentation/widgets/home_prayer_item.dart';
import 'package:advanced_quran_app/Features/prayer/presentation/view_model/prayer_cubit/prayer_cubit.dart';
import 'package:advanced_quran_app/Features/quran/data/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePrayerTimingSection extends StatelessWidget {
  const HomePrayerTimingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.prayerViewRoute);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      size: 16.sp,
                      color: Colors.white,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      "المزيد",
                      style: Styles.textStyle14,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text("( اليوم )",
                      style: Styles.textStyle16.copyWith(fontSize: 12.sp)),
                  SizedBox(width: 5.w),
                  Text("مواقيت الصلاة", style: Styles.textStyle20),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        BlocBuilder<PrayerCubit, PrayerState>(
          builder: (context, state) {
            if (state is PrayerSuccess) {
              List<String> prayerlist = [
                state.prayerModelList[dayDifference()].timings!.fajr!,
                state.prayerModelList[dayDifference()].timings!.dhuhr!,
                state.prayerModelList[dayDifference()].timings!.asr!,
                state.prayerModelList[dayDifference()].timings!.maghrib!,
                state.prayerModelList[dayDifference()].timings!.isha!,
              ];

              LocalNotificationServices.prayerList = prayerlist;
              print("prayerList: ${LocalNotificationServices.prayerList}");
              WorkManagerServices.init();
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: prayerlist
                      .asMap()
                      .entries
                      .map(
                        (e) => IntrinsicWidth(
                          child: Row(
                            children: [
                              SizedBox(width: e.key == 0 ? 15 : 10),
                              HomePrayerItem(
                                imagePath: prayerImagePath[e.key],
                                prayerTiming: prayerTiming[e.key],
                                time: prayerlist[e.key],
                              ),
                              SizedBox(width: e.key == 4 ? 15 : 0),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            } else if (state is PrayerFailure) {
              return CustomErrorWidget(errMessage: state.errMessage);
            }
            return const CustomLoadingWidget();
          },
        )
      ],
    );
  }
}
