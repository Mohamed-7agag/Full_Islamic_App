import 'package:advanced_quran_app/Core/utils/custom_loading_widget.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/prayer/presentation/view_model/prayer_cubit/prayer_cubit.dart';
import 'package:advanced_quran_app/Core/utils/custom_error_widget.dart';
import 'package:advanced_quran_app/Features/prayer/presentation/widgets/prayer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerViewBody extends StatelessWidget {
  const PrayerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "الفجر",
      "الظهر",
      "العصر",
      "المغرب",
      "العشاء",
    ];
    List<String> imagePath = [
      "assets/images/sunrise.png",
      "assets/images/sun.png",
      "assets/images/dawn.png",
      "assets/images/sunset.png",
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
          padding: EdgeInsets.only(top: 21.h, left: 15.w, right: 15.w),
          child: BlocBuilder<PrayerCubit, PrayerState>(
            builder: (context, state) {
              if (state is PrayerSuccess) {
                List<String> list = [
                  state.prayerModel.data!.timings!.fajr!,
                  state.prayerModel.data!.timings!.dhuhr!,
                  state.prayerModel.data!.timings!.asr!,
                  state.prayerModel.data!.timings!.maghrib!,
                  state.prayerModel.data!.timings!.isha!,
                ];
                return Column(
                  children: [
                    SizedBox(height: 70.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("قنا", style: Styles.textStyle18),
                              SizedBox(width: 5.w),
                              Image.asset(
                                "assets/images/pin.png",
                                width: 18.w,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "${state.prayerModel.data!.date!.hijri!.weekday!.ar!} , ${state.prayerModel.data!.date!.hijri!.day} ${state.prayerModel.data!.date!.hijri!.month!.ar}",
                                  style: Styles.textStyle18),
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
                    SizedBox(height: 8.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 12.h),
                            child: PrayerItem(
                              imagePath: imagePath[index],
                              text: items[index],
                              time: list[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
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
