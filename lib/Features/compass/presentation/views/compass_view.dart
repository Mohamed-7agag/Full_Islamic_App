import 'dart:math';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../view_model/compass_cubit.dart';

class CompassView extends StatefulWidget {
  const CompassView({super.key});

  @override
  State<CompassView> createState() => _CompassViewState();
}

class _CompassViewState extends State<CompassView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Stack(fit: StackFit.expand, alignment: Alignment.center, children: [
          Image.asset(
            "assets/images/background3.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  )),
              title: Text("اتجاة القبلة", style: Styles.textStyle23),
            ),
          ),
          BlocBuilder<CompassCubit, double>(
            builder: (context, heading) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 90.h,
                      left: 0,
                      right: 0,
                      child: Text(
                        "${heading.ceil()}°",
                        textAlign: TextAlign.center,
                        style: Styles.textStyle50,
                      ),
                    ),
                    Image.asset(
                      'assets/images/cadrant.png',
                      width: 250.w,
                    ),
                    Transform.rotate(
                      angle:
                          (heading * (pi / 180)), // Convert degrees to radians
                      child: Image.asset(
                        'assets/images/compass (2).png',
                        scale: 1.25,
                      ),
                    ),
                    Positioned(
                      bottom: 45.h,
                      left: 0,
                      right: 0,
                      child: Text(
                        "لتشغيل البوصلة بدون مشاكل, ضع الجهاز علي سطح مستو بعيدا عن الاشياء الممغنطة (المغناطيسية)",
                        textAlign: TextAlign.center,
                        style: Styles.textStyle20.copyWith(height: 1.7),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
