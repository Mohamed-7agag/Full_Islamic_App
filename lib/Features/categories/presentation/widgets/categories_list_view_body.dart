import 'package:advanced_quran_app/Core/utils/app_router.dart';
import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/categories/presentation/widgets/categories_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListViewBody extends StatelessWidget {
  const CategoriesListViewBody(
      {super.key, required this.text, required this.category});
  final String text;
  final List<List<String>> category;

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
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 56.h),
          child: ListView.builder(
            itemCount: category.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(top: 6.h, bottom: 6.h),
                child: CategoriesViewItem(
                  text: category[index][0],
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRouter.categoryItemsViewRoute,
                        arguments: {
                          "text": category[index][0],
                          "path": category[index][1],
                        });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
