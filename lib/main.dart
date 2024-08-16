import 'package:advanced_quran_app/Core/utils/app_router.dart';
import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Core/utils/service_locator.dart';
import 'package:advanced_quran_app/Features/categories/presentation/view_model/favourite_cubit.dart';
import 'package:advanced_quran_app/Features/quran/presentation/view_model/favourite_surah_cubit.dart';
import 'package:advanced_quran_app/Features/splash/presentation/views/splash_view.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Core/notification/notification_service.dart';
import 'Core/notification/work_manager_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    CacheHelper.init(),
    LocalNotificationServices.initialize(),
    //WorkManagerServices.init(),
  ]);
  
  setUp();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => FavouriteCubit()..getFavouriteList(),
      ),
      BlocProvider(
        create: (context) => FavouriteSurahCubit()..getFavouriteSurahList(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MaterialApp(
            theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: kBackgroundColor,
                textTheme: GoogleFonts.cairoTextTheme(
                  ThemeData.dark().textTheme,
                )),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
            onGenerateRoute: AppRouter.generateRoute,
            debugShowCheckedModeBanner: false,
            home: const SplashView(),
          ),
        );
      },
    );
  }
}
