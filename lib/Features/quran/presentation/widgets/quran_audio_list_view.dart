import 'package:advanced_quran_app/Core/utils/custom_loading_widget.dart';
import 'package:advanced_quran_app/Features/quran/presentation/view_model/quran_audio_cubit/quran_audio_cubit.dart';
import 'package:advanced_quran_app/Features/quran/presentation/widgets/quran_audio_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/custom_error_widget.dart';

class QuranAudioListView extends StatelessWidget {
  const QuranAudioListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: BlocBuilder<QuranAudioCubit, QuranAudioState>(
        builder: (context, state) {
          if (state is QuranAudioSuccess) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: QuranAudioItem(
                    quranAudioModel: state.list[index],
                  ),
                );
              },
            );
          } else if (state is QuranAudioFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}
