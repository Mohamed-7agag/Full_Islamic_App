import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/date_and_time_cubit.dart';
import 'date_and_time.dart';

class DateAndTimeSection extends StatelessWidget {
  const DateAndTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/im1.png",
          width: 200.w,
        ),
        Expanded(
          child: BlocBuilder<DateTimeCubit, DateTime>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildTime(state),
                  buildDayAndMonth(state),
                  SizedBox(height: 5.h),
                  buildDate(state),
                  SizedBox(height: 25.h),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
