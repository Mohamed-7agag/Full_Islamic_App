import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/local_data.dart';
import '../view_model/quran_details_cubit.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key, required this.surahPos});
  final int surahPos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fcfd),
      body: SafeArea(
        child: BlocBuilder<ActionCubit, bool>(
          builder: (context, state) {
            return Stack(
              children: [
                PageView.builder(
                  onPageChanged: (value) {
                    context.read<ChangeNumberCubit>().change(604 - value);
                    context.read<ChangeJuzCubit>().changeJuzName(604 - value);
                  },
                  controller: PageController(initialPage: 604 - surahPos),
                  itemCount: 604,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        context.read<ActionCubit>().toggleAction();
                      },
                      child: Image.asset(
                        "assets/quran-images/${604 - index}.png",
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
                state == true
                    ? BlocBuilder<ChangeNumberCubit, int>(
                        builder: (context, intState) {
                          return Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              width: double.infinity,
                              height: 60.h,
                              color: const Color.fromRGBO(0, 0, 0, 0.90),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BlocBuilder<MarkCubit, bool>(
                                    builder: (context, markState) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 30.w),
                                        child: InkWell(
                                          onTap: () {
                                            if (CacheHelper.getData(
                                                    key: "mark") ==
                                                intState) {
                                              CacheHelper.removeData(
                                                  key: "mark");
                                            } else {
                                              CacheHelper.setData(
                                                  key: "mark", value: intState);
                                            }

                                            context
                                                .read<MarkCubit>()
                                                .changeMark();
                                          },
                                          child: Image.asset(
                                            CacheHelper.getData(key: "mark") !=
                                                    intState
                                                ? "assets/images/bookmark.png"
                                                : "assets/images/book-mark(1).png",
                                            width: 24.w,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Text(
                                    "$intState",
                                    style: Styles.textStyle20,
                                  ),
                                  BlocBuilder<ChangeJuzCubit, int>(
                                    builder: (context, numberState) {
                                      return Text(
                                        "${juz[numberState - 1][0]}",
                                        style: Styles.textStyle18,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const Positioned(
                        top: 0, left: 0, right: 0, child: SizedBox()),
              ],
            );
          },
        ),
      ),
    );
  }
}
