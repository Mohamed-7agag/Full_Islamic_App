import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/home/presentation/view_model/cubit/sibha_cubit.dart';
import 'package:advanced_quran_app/Features/home/presentation/widgets/alert.dart';
import 'package:advanced_quran_app/Features/home/presentation/widgets/sibha_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SibhaView extends StatelessWidget {
  const SibhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/background3.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            InkWell(
              onTap: () {
                context.read<SibhaCubit>().increment();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 12.h),
                child: BlocBuilder<SibhaCubit, List<int>>(
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                BlocBuilder<SibhaTextCubit, String>(
                                  builder: (context, textState) {
                                    return Text(
                                      textState,
                                      style: Styles.textStyle23,
                                    );
                                  },
                                ),
                                const Text(""),
                              ],
                            ),
                            SizedBox(height: 80.h),
                            SizedBox(
                              height: 300.h,
                              width: 300.w,
                              child: CircularPercentIndicator(
                                radius: 140.r,
                                lineWidth: 5.w,
                                percent: state[0] / 33,
                                progressColor: Colors.white,
                                circularStrokeCap: CircularStrokeCap.round,
                                backgroundWidth: 3.5.w,
                                backgroundColor: kShadeWhite,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${state[0]}",
                                      style: Styles.textStyle120.copyWith(),
                                    ),
                                    Text(
                                      "33",
                                      style: Styles.textStyle23.copyWith(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 40.h),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${state[1]}",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.white),
                                ),
                                const Text(
                                  "المرات المكتملة",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            const Divider(
                              thickness: 0.7,
                              color: kShadeWhite,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${state[2]}",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.white),
                                ),
                                const Text(
                                  "العدد الاجمالي",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox(height: 20.h)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SibhaButton(
                              icon: Icon(
                                Icons.edit_rounded,
                                size: 27.sp,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                openDialog(context: context);
                              },
                            ),
                            SizedBox(width: 12.w),
                            SibhaButton(
                              icon: Icon(
                                Icons.replay_rounded,
                                size: 27.sp,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                context.read<SibhaCubit>().resetCounter();
                              },
                            ),
                            SizedBox(width: 12.w),
                            SibhaButton(
                              icon: Icon(
                                Icons.cached_rounded,
                                size: 27.sp,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                context.read<SibhaCubit>().reset();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
