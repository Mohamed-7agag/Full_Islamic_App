import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/cubit/sibha_cubit.dart';
import 'sibha_dialog_item.dart';

Future openDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (BuildContext context1) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.start,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'أختر ذكر',
          textDirection: TextDirection.rtl,
          style: TextStyle(color: Colors.black),
        ),
        content: SizedBox(
          height: 400.h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SibhaDialogItem(
                  text: "سُبْحَانَ اللَّهِ",
                  onTap: () {
                    context.read<SibhaTextCubit>().setText("سُبْحَانَ اللَّهِ");
                  },
                ),
                SibhaDialogItem(
                  text: "الحمد لله",
                  onTap: () {
                    context.read<SibhaTextCubit>().setText("الحمد لله");
                  },
                ),
                SibhaDialogItem(
                  text: "لَا إِلَهَ إِلَّا اللَّهُ",
                  onTap: () {
                    context
                        .read<SibhaTextCubit>()
                        .setText("لَا إِلَهَ إِلَّا اللَّهُ");
                  },
                ),
                SibhaDialogItem(
                  text: "الْلَّهُم صَلِّ عَلَى سَيِّدِنَا مُحَمَّد",
                  onTap: () {
                    context
                        .read<SibhaTextCubit>()
                        .setText("الْلَّهُم صَلِّ عَلَى سَيِّدِنَا مُحَمَّد");
                  },
                ),
                SibhaDialogItem(
                  text: "الْلَّهُ أَكْبَرُ",
                  onTap: () {
                    context.read<SibhaTextCubit>().setText("الْلَّهُ أَكْبَرُ");
                  },
                ),
                SibhaDialogItem(
                  text: "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
                  onTap: () {
                    context
                        .read<SibhaTextCubit>()
                        .setText("سُبْحَانَ اللَّهِ وَبِحَمْدِهِ");
                  },
                ),
                SibhaDialogItem(
                  text: "الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ",
                  onTap: () {
                    context
                        .read<SibhaTextCubit>()
                        .setText("الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ");
                  },
                ),
                SibhaDialogItem(
                  text: "أستغفر الله",
                  onTap: () {
                    context.read<SibhaTextCubit>().setText("أستغفر الله");
                  },
                ),
                SibhaDialogItem(
                  text: "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ",
                  onTap: () {
                    context
                        .read<SibhaTextCubit>()
                        .setText("لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ");
                  },
                ),
              ],
            ),
          ),
        ),
        actionsPadding: EdgeInsets.only(left: 20.w, bottom: 10.h),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('حسنا',
                style: Styles.textStyle18.copyWith(
                  color: kPrimaryColor,
                )),
          ),
        ],
      );
    },
  );
}
