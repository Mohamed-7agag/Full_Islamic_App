import 'package:advanced_quran_app/Core/utils/custom_error_widget.dart';
import 'package:advanced_quran_app/Core/utils/custom_loading_widget.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/allah_names/presentation/view_model/allah_names_cubit/allah_names_cubit.dart';
import 'package:advanced_quran_app/Features/allah_names/presentation/widgets/allah_names_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllahNamesViewBody extends StatelessWidget {
  const AllahNamesViewBody({super.key});

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
              title: Text("أسماء الله الحسني", style: Styles.textStyle23),
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
                    child: BlocBuilder<AllahNamesCubit, AllahNamesState>(
                      builder: (context, state) {
                        if (state is AllahNamesSuccess) {
                          return ListView.builder(
                            itemCount: state.dataList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: AllahNamesItem(
                                  allahNamesModel: state.dataList[index],
                                ),
                              );
                            },
                          );
                        } else if (state is AllahNamesFailure) {
                          return CustomErrorWidget(
                              errMessage: state.errMesaage);
                        }
                        return const CustomLoadingWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
