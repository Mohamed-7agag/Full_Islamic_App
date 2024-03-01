import 'package:advanced_quran_app/Core/utils/app_router.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/quran/data/models/quran_audio_model/quran_audio_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/constants.dart';

class QuranAudioItem extends StatelessWidget {
  const QuranAudioItem({super.key, required this.quranAudioModel});
  final QuranAudioModel quranAudioModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.quranAudioViewRoute,
            arguments: quranAudioModel);
      },
      child: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          width: double.infinity,
          height: 65.h,
          decoration: BoxDecoration(
            color: kShadeWhite,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              Text(
                "${quranAudioModel.title}",
                style: Styles.textStyle18,
              ),
            ],
          )),
    );
  }
}
