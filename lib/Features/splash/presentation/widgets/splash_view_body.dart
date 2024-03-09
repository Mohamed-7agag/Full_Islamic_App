import 'package:advanced_quran_app/Core/utils/app_router.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1600), () {
      CacheHelper.getData(key: 'location') == 'done'
          ? Navigator.pushReplacementNamed(context, AppRouter.homeViewRoute)
          : Navigator.pushReplacementNamed(
              context, AppRouter.locationViewRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Image.asset(
        "assets/images/splash2.png",
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
      Text(
        "الرفيق",
        style: GoogleFonts.blakaHollow(fontSize: 80.sp, color: Colors.white),
      ),
    ]);
  }
}
