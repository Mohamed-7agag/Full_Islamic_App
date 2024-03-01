import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/categories/presentation/widgets/category_items_view_item.dart';
import 'package:advanced_quran_app/Core/utils/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/categories_cubit/categories_cubit.dart';

class CategoryItemsViewBody extends StatelessWidget {
  const CategoryItemsViewBody({super.key, required this.text});
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
          child: Padding(
            padding: EdgeInsets.only(left: 10.w,right: 18.w,top: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    )),
                Expanded(
                  child: Text(
                    text,
                    style: Styles.textStyle23,
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 56.h),
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesSuccess) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 6.h, bottom: 6.h),
                      child: CategoryItemsViewItem(
                          categoriesModel1: state.list[index]),
                    );
                  },
                );
              } else if (state is CategoriesFailure) {
                return CustomErrorWidget(errMessage: state.errMessage);
              }
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 2.4.w,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
