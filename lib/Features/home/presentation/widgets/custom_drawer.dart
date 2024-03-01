import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/home/presentation/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          "assets/images/background3.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "الرفيق",
                    style: GoogleFonts.blakaHollow(
                        fontSize: 60.sp, color: Colors.white),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "الرفيق ... تطبيق كل مسلم",
                    style: Styles.textStyle18,
                  ),
                  SizedBox(height: 45.h),
                  const DrawerItem(
                      text: "تقييم", path: "assets/images/rate.png"),
                  SizedBox(height: 28.h),
                  const DrawerItem(
                      text: "مشاركه البرنامج", path: "assets/images/share.png"),
                  SizedBox(height: 28.h),
                  const DrawerItem(
                      text: "مساعدة", path: "assets/images/help.png"),
                  SizedBox(height: 28.h),
                  const DrawerItem(
                      text: "تواصل معنا", path: "assets/images/contact.png"),
                  SizedBox(height: 20.h),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/images/facebook.png",
                        width: 40.w,
                      ),
                      Image.asset(
                        "assets/images/telegram.png",
                        width: 40.w,
                      ),
                      Image.asset(
                        "assets/images/linkedin.png",
                        width: 40.w,
                      ),
                      Image.asset(
                        "assets/images/github.png",
                        width: 40.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  const Text(
                    "© جميع الحقوق محفوظة",
                    style: TextStyle(color: Colors.white54),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
