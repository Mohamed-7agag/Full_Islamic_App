import 'package:advanced_quran_app/Core/utils/custom_loading_widget.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Core/utils/custom_error_widget.dart';
import 'package:advanced_quran_app/Features/quran/data/models/quran_audio_model/quran_audio_model.dart';
import 'package:advanced_quran_app/Features/quran/presentation/view_model/quran_cubit/quran_cubit.dart';
import 'package:advanced_quran_app/Features/quran/presentation/widgets/quran_audio_player_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuranAudioViewBody extends StatelessWidget {
  const QuranAudioViewBody({super.key, required this.quranAudioModel});
  final QuranAudioModel quranAudioModel;

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
            title: Text(quranAudioModel.title!, style: Styles.textStyle20),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 56.h, left: 15.w, right: 15.w),
          child: BlocBuilder<QuranCubit, QuranState>(
            builder: (context, state) {
              if (state is QuranSuccess) {
                return ListView.builder(
                  itemCount: quranAudioModel.attachments!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: QuranAudioPlayerItem(
                        index: index,
                        url: quranAudioModel.attachments![index].url!,
                        surahName: state.quran[index].name!,
                        personName: quranAudioModel.title!,
                      ),
                    );
                  },
                );
              } else if (state is QuranFailure) {
                return CustomErrorWidget(errMessage: state.errMessage);
              }
              return const CustomLoadingWidget();
            },
          ),
        ),
      ],
    );
  }
}
