import 'package:flutter/material.dart';

const Color kBackgroundColor = Color(0xff112095);
const Color kPrimaryColor = Color(0xff65D6FC);
const Color kShadeWhite = Color.fromRGBO(255, 255, 255, 0.13);

const String favouriteKey = "favouriteKey";
const String favouriteSurahKey = "favouriteSurahKey";

String lat = '';
String lang = '';

List<List<String>> prayerTitleAndBodyList = [
  ['صلاة الفجر', 'حان الأن موعد صلاة الفجر'],
  ['صلاة الظهر', 'حان الأن موعد صلاة الظهر'],
  ['صلاة العصر', 'حان الأن موعد صلاة العصر'],
  ['صلاة المغرب', 'حان الأن موعد صلاة المغرب'],
  ['صلاة العشاء', 'حان الأن موعد صلاة العشاء'],
];
