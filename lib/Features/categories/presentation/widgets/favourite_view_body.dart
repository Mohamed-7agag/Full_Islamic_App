import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/categories/data/models/categories_model1.dart';
import 'package:advanced_quran_app/Features/categories/presentation/view_model/favourite_cubit.dart';
import 'package:advanced_quran_app/Features/categories/presentation/widgets/favourite_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

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
            title: Text("المفضلة", style: Styles.textStyle23),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 56.h),
          child: BlocBuilder<FavouriteCubit, FavouriteState>(
            builder: (context, state) {
              List<CategoriesModel1> items =
                  context.read<FavouriteCubit>().getFavouriteList();
              return items.isEmpty
                  ? Center(
                      child: Text(
                      "لا يوجد تفضيلات",
                      style: Styles.textStyle20,
                    ))
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
                          child: FavouriteListViewItem(
                              categoriesModel1: items[index]),
                        );
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}
