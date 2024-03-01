import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

Widget buildDate(DateTime dateTime) {
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return Text(
    formattedDate,
    style: Styles.textStyle16.copyWith(fontSize: 15.sp),
  );
}

Widget buildTime(DateTime dateTime) {
  String formattedTime = DateFormat('hh:mm').format(dateTime);
  return Text(
    formattedTime,
    style: TextStyle(fontSize: 60.sp, color: Colors.white),
  );
}

Widget buildDayAndMonth(DateTime dateTime) {
  initializeDateFormatting();
  String formattedDayAndMonth =
      DateFormat('MMMM , EEEE', 'ar').format(dateTime);

  return Text(formattedDayAndMonth,
      style: Styles.textStyle16.copyWith(fontSize: 15.sp));
}
