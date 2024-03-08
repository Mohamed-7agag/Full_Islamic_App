import 'dart:convert';

import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/categories/data/models/categories_model1.dart';
import 'package:advanced_quran_app/Features/categories/presentation/view_model/favourite_cubit.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';

class TextView extends StatelessWidget {
  const TextView({super.key, required this.categoriesModel1});
  final CategoriesModel1 categoriesModel1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              "assets/images/splash2.png",
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
                actions: [
                  IconButton(
                      onPressed: () {
                        Share.share(
                            "${categoriesModel1.number!}\n\n${categoriesModel1.text!}");
                      },
                      icon: Icon(
                        Icons.share,
                        size: 25.sp,
                        color: Colors.white,
                      )),
                  BlocBuilder<FavouriteCubit, FavouriteState>(
                    builder: (context, state) {
                      bool ok = CacheHelper.getStringList(key: favouriteKey)
                          .contains(json.encode(categoriesModel1.toJson()));
                      return IconButton(
                        onPressed: () {
                          if (state == FavouriteState.favourite) {
                            context.read<FavouriteCubit>().unFavourite(
                                  categoriesModel1: categoriesModel1,
                                );
                          } else {
                            context.read<FavouriteCubit>().favourite(
                                  categoriesModel1: categoriesModel1,
                                );
                          }
                          context.read<FavouriteCubit>().getFavouriteList();
                        },
                        icon: ok == true
                            ? Image.asset(
                                "assets/images/heart.png",
                                width: 30.w,
                              )
                            : Icon(
                                Icons.favorite_border_rounded,
                                size: 27.sp,
                                color: Colors.white,
                              ),
                      );
                    },
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 56.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 14.h),
                    Container(
                      padding: EdgeInsets.only(
                          top: 8.h, bottom: 11.h, left: 10.w, right: 10.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: kShadeWhite,
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Text(
                        categoriesModel1.number!,
                        style: Styles.textStyle25.copyWith(
                            height: 1.8.h, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      categoriesModel1.text!,
                      style: Styles.textStyle20
                          .copyWith(height: 1.8.h, fontSize: 21.sp),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 14.h),
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
