import 'dart:convert';

import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Features/quran/presentation/view_model/favourite_surah_cubit.dart';
import 'package:advanced_quran_app/Features/quran/presentation/view_model/quran_audio_player_cubit.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'text_and_image_section.dart';

class AudoViewBody extends StatelessWidget {
  const AudoViewBody({super.key, required this.object});
  final Map<String, dynamic> object;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
            actions: [
              BlocBuilder<FavouriteSurahCubit, FavouriteSurahState>(
                builder: (context, state) {
                  bool ok = CacheHelper.getStringList(key: favouriteSurahKey)
                      .contains(jsonEncode(object));
                  return IconButton(
                    onPressed: () {
                      if (state == FavouriteSurahState.favourite) {
                        context.read<FavouriteSurahCubit>().unFavourite(
                              object: object,
                            );
                      } else {
                        context.read<FavouriteSurahCubit>().favourite(
                              object: object,
                            );
                      }
                      context
                          .read<FavouriteSurahCubit>()
                          .getFavouriteSurahList();
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 14.h),
                TextAndImageSection(
                  object: object,
                ),
                SizedBox(height: 25.h),
                BlocBuilder<AudioPlayerCubit, AudioPlayerStatus>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        BlocBuilder<AudioPlayerPositionCubit, Duration>(
                          builder: (context, durState) {
                            context
                                .read<AudioPlayerPositionCubit>()
                                .currentPosition(context
                                    .read<AudioPlayerCubit>()
                                    .audioPlayer);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${durState.inMinutes}:${durState.inSeconds % 60}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Expanded(
                                  child: Slider(
                                    value: durState.inSeconds.toDouble(),
                                    onChanged: (val) {
                                      context.read<AudioPlayerCubit>().seeked(
                                          Duration(seconds: val.toInt()));
                                      context
                                          .read<AudioPlayerCubit>()
                                          .play(url: object['url']);
                                    },
                                    min: 0.0,
                                    max: context
                                        .read<AudioPlayerCubit>()
                                        .duration
                                        .inSeconds
                                        .toDouble(),
                                    activeColor: Colors.white,
                                    inactiveColor: kShadeWhite,
                                  ),
                                ),
                                Text(
                                  "${context.read<AudioPlayerCubit>().duration.inMinutes}:${context.read<AudioPlayerCubit>().duration.inSeconds % 60}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 25.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<AudioPlayerCubit>().seekBackword();
                                context
                                    .read<AudioPlayerCubit>()
                                    .play(url: object['url']);
                              },
                              icon: Icon(
                                Icons.replay_10_outlined,
                                size: 38.sp,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (state == AudioPlayerStatus.playing) {
                                  context.read<AudioPlayerCubit>().pause();
                                } else {
                                  context
                                      .read<AudioPlayerCubit>()
                                      .play(url: object['url']);
                                }
                              },
                              icon: Icon(
                                state == AudioPlayerStatus.playing
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: 45.sp,
                                color: Colors.white,
                              ),
                              style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  kShadeWhite,
                                ),
                                padding: WidgetStatePropertyAll(
                                    EdgeInsets.all(10)),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<AudioPlayerCubit>().seekForward();
                                context
                                    .read<AudioPlayerCubit>()
                                    .play(url: object['url']);
                              },
                              icon: Icon(
                                Icons.forward_10_outlined,
                                size: 38.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
