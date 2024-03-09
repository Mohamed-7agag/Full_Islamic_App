// ignore_for_file: avoid_print

import 'package:advanced_quran_app/Core/utils/app_router.dart';
import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/location.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/home/presentation/views/home_view.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

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
      // Handle other exceptions
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          //fit: StackFit.expand,
          alignment: Alignment.center,
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.09),
                    borderRadius: BorderRadius.circular(16.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      "الرفيق هو تطبيق اسلامي يحتوي كل الاشياء التي يحتاجها المسلم",
                      style: Styles.textStyle18.copyWith(height: 1.7),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50.h),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.homeViewRoute);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 0.0),
                          padding: const EdgeInsets.symmetric(vertical: 10)),
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
                    SizedBox(height: 50.h),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
