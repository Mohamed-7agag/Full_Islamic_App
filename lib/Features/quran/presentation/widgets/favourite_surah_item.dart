import 'package:advanced_quran_app/Core/utils/app_router.dart';
import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/quran/presentation/view_model/favourite_surah_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteSurahItem extends StatelessWidget {
  const FavouriteSurahItem({super.key, required this.object});
  final Map<String, dynamic> object;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.audioViewRoute,
            arguments: object);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: kShadeWhite,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<FavouriteSurahCubit, FavouriteSurahState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    context
                        .read<FavouriteSurahCubit>()
                        .unFavourite(object: object);
                  },
                  child: Image.asset(
                    "assets/images/dislike.png",
                    width: 30.w,
                  ),
                );
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  object['personName'],
                  style: Styles.textStyle16.copyWith(fontSize: 14.sp),
                ),
                SizedBox(height: 5.h),
                Text(
                  "سورة  ${object['surahName']}",
                  style: Styles.textStyle18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
