import 'dart:developer';

import 'package:advanced_quran_app/Core/utils/location.dart';
import 'package:advanced_quran_app/Core/utils/routes.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  void initState() {
    _getLocation();
    CacheHelper.setData(key: 'location', value: 'done');
    super.initState();
  }

  Future<void> _getLocation() async {
    try {
      Position position = await LocationService().getLocation();
      CacheHelper.setData(key: 'lat', value: position.latitude.toString());
      CacheHelper.setData(key: 'long', value: position.longitude.toString());
    } catch (e) {
      log("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/splash2.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.09),
                    borderRadius: BorderRadius.circular(16.r)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "الرفيق",
                            style: GoogleFonts.blakaHollow(
                                fontSize: 35.sp, color: Colors.white),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "مرحبا بك في تطبيق",
                            style: Styles.textStyle20,
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "الرفيق ... تطبيق لكل مسلم",
                        style: Styles.textStyle16,
                      ),
                      Image.asset(
                        "assets/images/im1.png",
                        width: double.infinity,
                        height: 350.h,
                      ),
                      Text(
                        "الرفيق هو تطبيق اسلامي يحتوي علي كل ما يحتاجة المسلم",
                        style: Styles.textStyle18.copyWith(height: 1.7),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 50.h),
                      ElevatedButton(
                        onPressed: () async {
                          if (await CacheHelper.containsKey(key: 'lat')) {
                            if (context.mounted) {
                              Navigator.pushNamed(
                                  context, Routes.homeViewRoute);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 255, 255, 0.0),
                            padding: EdgeInsets.symmetric(vertical: 10.h)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "هيا لنبدا",
                              style: Styles.textStyle20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
