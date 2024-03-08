import 'package:advanced_quran_app/Core/utils/custom_loading_widget.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/prayer/presentation/view_model/prayer_cubit/prayer_cubit.dart';
import 'package:advanced_quran_app/Core/utils/custom_error_widget.dart';
import 'package:advanced_quran_app/Features/prayer/presentation/widgets/prayer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PrayerViewBody extends StatelessWidget {
  const PrayerViewBody({super.key});

  String formatTime(String time) {
    DateTime dateTime =
        DateFormat('HH:mm').parse(time.substring(0, time.length - 6));
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    DateTime givenDate = DateTime.now();
    DateTime firstDayOfYear = DateTime(DateTime.now().year, 1, 1);
    int daysDifference = givenDate.difference(firstDayOfYear).inDays;
    List<String> items = [
      "الفجر",
      "الشروق",
      "الظهر",
      "العصر",
      "الغروب",
      "المغرب",
      "العشاء",
      "الامساك",
      "منتصف الليل",
      "الثلث الاول",
      "الثلث الاخير",
    ];
    List<String> imagePath = [
      "assets/images/sunrise.png",
      "assets/images/sunrise2.png",
      "assets/images/sun.png",
      "assets/images/dawn.png",
      "assets/images/sunset2.png",
      "assets/images/sunset.png",
      "assets/images/full-moon.png",
      "assets/images/no-food.png",
      "assets/images/moon2.png",
      "assets/images/full-moon.png",
      "assets/images/full-moon.png",
    ];

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
            title: Text("مواقيت الصلاة", style: Styles.textStyle23),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 56.h, left: 15.w, right: 15.w),
          child: BlocBuilder<PrayerCubit, PrayerState>(
            builder: (context, state) {
              if (state is PrayerSuccess) {
                List<String> list = [
                  formatTime(
                      state.prayerModelList[daysDifference].timings!.fajr!),
                  formatTime(
                      state.prayerModelList[daysDifference].timings!.sunrise!),
                  formatTime(
                      state.prayerModelList[daysDifference].timings!.asr!),
                  formatTime(
                      state.prayerModelList[daysDifference].timings!.sunset!),
                  formatTime(
                      state.prayerModelList[daysDifference].timings!.dhuhr!),
                  formatTime(
                      state.prayerModelList[daysDifference].timings!.maghrib!),
                  formatTime(
                      state.prayerModelList[daysDifference].timings!.isha!),
                  formatTime(
                      state.prayerModelList[daysDifference].timings!.imsak!),
                  formatTime(
                      state.prayerModelList[daysDifference].timings!.midnight!),
                  formatTime(state
                      .prayerModelList[daysDifference].timings!.firstthird!),
                  formatTime(state
                      .prayerModelList[daysDifference].timings!.lastthird!),
                ];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                "${state.prayerModelList[daysDifference].date!.hijri!.weekday!.ar!} , ${state.prayerModelList[daysDifference].date!.hijri!.day} ${state.prayerModelList[daysDifference].date!.hijri!.month!.ar}",
                                style: Styles.textStyle16),
                            SizedBox(width: 7.w),
                            Image.asset(
                              "assets/images/calendar.png",
                              width: 18.w,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      ListView.builder(
                        itemCount: list.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 6.h,bottom: 6),
                            child: PrayerItem(
                              imagePath: imagePath[index],
                              text: items[index],
                              time: list[index],
                            ),
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
