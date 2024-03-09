import 'package:intl/intl.dart';

String formatTime(String time) {
    DateTime dateTime =
        DateFormat('HH:mm').parse(time.substring(0, time.length - 6));
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }