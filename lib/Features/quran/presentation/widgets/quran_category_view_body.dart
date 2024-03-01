import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:advanced_quran_app/Features/quran/presentation/widgets/quran_audio_list_view.dart';
import 'package:advanced_quran_app/Features/quran/presentation/widgets/quran_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuranCategoryViewBody extends StatelessWidget {
  const QuranCategoryViewBody({super.key});

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
        DefaultTabController(
          initialIndex: 1,
          length: 2, 
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 15.h),
                    child: Text(
                      "القرآن الكريم",
                      style: Styles.textStyle23,
                    ),
                  ),
                  const TabBar(
                    labelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(text: 'أستماع'),
                      Tab(text: 'قراءة'),
                    ],
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    QuranAudioListView(),
                    QuranListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
