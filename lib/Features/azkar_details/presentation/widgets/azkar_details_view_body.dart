import 'package:advanced_quran_app/Core/utils/custom_error_widget.dart';
import 'package:advanced_quran_app/Core/utils/custom_loading_widget.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Core/view_models/azkar_cubit/azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'azkar_details_list_view_item.dart';

class AzkarDetailsViewBody extends StatelessWidget {
  const AzkarDetailsViewBody({super.key, required this.text});
  final String text;

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
            title: Text(text, style: Styles.textStyle23),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 21.h, left: 15.w, right: 15.w),
          child: Column(
            children: [
              SizedBox(height: 35.h),
              Expanded(
                child: SizedBox(
                  height: 200.h,
                  child: BlocBuilder<AzkarCubit, AzkarState>(
                    builder: (context, state) {
                      if (state is AzkarSuccess) {
                        return ListView.builder(
                          itemCount: state.azkar.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 15.h),
                              child: AzkarDetailsListViewItem(
                                index: index,
                                length: state.azkar.length,
                                azkarModel: state.azkar[index],
                              ),
                            );
                          },
                        );
                      } else if (state is AzkarFailure) {
                        return CustomErrorWidget(errMessage: state.errMessage);
                      }
                      return const CustomLoadingWidget();
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
