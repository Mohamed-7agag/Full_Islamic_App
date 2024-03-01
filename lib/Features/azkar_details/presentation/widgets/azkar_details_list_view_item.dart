import 'package:advanced_quran_app/Core/models/azkar_model.dart';
import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Core/view_models/azkar_counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share/share.dart';

class AzkarDetailsListViewItem extends StatelessWidget {
  const AzkarDetailsListViewItem({
    super.key,
    required this.azkarModel,
    required this.length,
    required this.index,
  });
  final AzkarModel azkarModel;
  final int length;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCounterCubit, List<int>>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context
                .read<AzkarCounterCubit>()
                .increase(azkarModel.repeat!, index);
          },
          child: Container(
            padding:
                 EdgeInsets.only(left: 12.w, right: 12.w, bottom: 15.h, top: 20.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.09),
              borderRadius: BorderRadiusDirectional.all(Radius.circular(18.r)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${azkarModel.zekr}",
                  style: Styles.textStyle25.copyWith(height: 1.8),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
                azkarModel.bless! != ""
                    ? SizedBox(height: 40.h)
                    : const SizedBox(height: 0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    "${azkarModel.bless}",
                    style: Styles.textStyle16
                        .copyWith(fontStyle: FontStyle.normal),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        Share.share(azkarModel.zekr!);
                      },
                      icon: const Icon(Icons.share, color: Colors.white),
                    ),
                    SizedBox(
                      width: 80.w,
                      height: 60.h,
                      child: CircularPercentIndicator(
                        radius: 28.r,
                        lineWidth: 2.5.w,
                        circularStrokeCap: CircularStrokeCap.round,
                        percent: state[index] / azkarModel.repeat!,
                        progressColor: Colors.white,
                        backgroundColor: kShadeWhite,
                        center: state[index] >= azkarModel.repeat!
                            ? Icon(
                                Icons.done_rounded,
                                size: 30.sp,
                                color: Colors.white,
                              )
                            : Text(
                                "${azkarModel.repeat! - state[index]}",
                                style: Styles.textStyle18
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                        backgroundWidth: 2.w,
                      ),
                    ),
                    Text(
                      "${index + 1}/$length",
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
