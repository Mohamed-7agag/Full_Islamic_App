import 'package:advanced_quran_app/Core/utils/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/custom_error_widget.dart';
import '../view_model/quran_cubit/quran_cubit.dart';
import 'quran_listview_item.dart';

class QuranListView extends StatelessWidget {
  const QuranListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          if (state is QuranSuccess) {
            return ListView.builder(
              itemCount: state.quran.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: QuranListViewItem(
                    quranModel: state.quran[index],
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
    );
  }
}
