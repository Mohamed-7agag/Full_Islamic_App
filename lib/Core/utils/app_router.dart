import 'package:advanced_quran_app/Core/utils/service_locator.dart';
import 'package:advanced_quran_app/Core/view_models/azkar_counter_cubit.dart';
import 'package:advanced_quran_app/Core/view_models/azkar_cubit/azkar_cubit.dart';
import 'package:advanced_quran_app/Features/allah_names/presentation/view_model/allah_names_cubit/allah_names_cubit.dart';
import 'package:advanced_quran_app/Features/allah_names/presentation/views/allah_names_view.dart';
import 'package:advanced_quran_app/Features/azkar_details/presentation/views/azkar_category_view.dart';
import 'package:advanced_quran_app/Features/azkar_details/presentation/views/azkar_details_view.dart';
import 'package:advanced_quran_app/Features/categories/data/models/categories_model1.dart';
import 'package:advanced_quran_app/Features/categories/presentation/views/categories_list_view.dart';
import 'package:advanced_quran_app/Features/categories/presentation/views/categories_view.dart';
import 'package:advanced_quran_app/Features/categories/presentation/views/category_items_view.dart';
import 'package:advanced_quran_app/Features/categories/presentation/views/favourite_view.dart';
import 'package:advanced_quran_app/Features/categories/presentation/views/text_view.dart';
import 'package:advanced_quran_app/Features/compass/presentation/view_model/compass_cubit.dart';
import 'package:advanced_quran_app/Features/compass/presentation/views/compass_view.dart';
import 'package:advanced_quran_app/Features/home/presentation/view_model/cubit/sibha_cubit.dart';
import 'package:advanced_quran_app/Features/home/presentation/view_model/date_and_time_cubit.dart';
import 'package:advanced_quran_app/Features/home/presentation/views/home_view.dart';
import 'package:advanced_quran_app/Features/home/presentation/views/sibha_view.dart';
import 'package:advanced_quran_app/Features/prayer/data/repos/prayer_repo_implement.dart';
import 'package:advanced_quran_app/Features/prayer/presentation/view_model/prayer_cubit/prayer_cubit.dart';
import 'package:advanced_quran_app/Features/prayer/presentation/views/prayer_view.dart';
import 'package:advanced_quran_app/Features/quran/data/local_data.dart';
import 'package:advanced_quran_app/Features/quran/data/models/quran_audio_model/quran_audio_model.dart';
import 'package:advanced_quran_app/Features/quran/presentation/views/audio_view.dart';
import 'package:advanced_quran_app/Features/quran/presentation/views/favourite_surah_view.dart';
import 'package:advanced_quran_app/Features/quran/presentation/views/quran_audio_view.dart';
import 'package:advanced_quran_app/Features/quran/presentation/views/quran_category_view.dart';
import 'package:advanced_quran_app/Features/quran/presentation/views/quran_view.dart';
import 'package:advanced_quran_app/Features/splash/presentation/views/splash_view.dart';
import 'package:advanced_quran_app/location_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Features/categories/presentation/view_model/categories_cubit/categories_cubit.dart';
import '../../Features/quran/presentation/view_model/quran_audio_cubit/quran_audio_cubit.dart';
import '../../Features/quran/presentation/view_model/quran_audio_player_cubit.dart';
import '../../Features/quran/presentation/view_model/quran_cubit/quran_cubit.dart';
import '../../Features/quran/presentation/view_model/quran_details_cubit.dart';

class AppRouter {
  //! Routes Names
  static const String splashViewRoute = "/";
  static const String homeViewRoute = "/homeView";
  static const String azkarDetailsRoute = "/azkarDetailsView";
  static const String azkarCategoryViewRoute = "/azkarCategoryView";
  static const String prayerViewRoute = "/prayerView";
  static const String quranCategoryViewRoute = "/quranCategoryView";
  static const String sibhaViewRoute = "/sibhaView";
  static const String allahNamesViewRoute = "/allahNamesView";
  static const String compassViewRoute = "/compassView";
  static const String quranViewRoute = "/quranView";
  static const String quranAudioViewRoute = "/quranAudioView";
  static const String categoriesViewRoute = "/categoriesView";
  static const String categoriesListViewRoute = "/categoriesListView";
  static const String categoryItemsViewRoute = "/categoryItemsView";
  static const String textViewRoute = "/textView";
  static const String audioViewRoute = "/audioView";
  static const String favouriteViewRoute = "/favouriteView";
  static const String favouriteSurahViewRoute = "/favouriteSurahView";
  static const String locationViewRoute = "/locationViewRoute";
  //! Generate Routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //! splashViewRoute
      case splashViewRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      //! homeViewRoute
      case homeViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => DateTimeCubit(),
              ),
              BlocProvider(
                create: (context) =>
                    PrayerCubit(getIt.get<PrayerRepoImplement>())
                      ..loadPrayerTimings(
                        year: DateTime.now().year.toString(),
                      ),
              ),
            ],
            child: const HomeView(),
          ),
        );
      // //! locationViewRoute
      case locationViewRoute:
        return MaterialPageRoute(
          builder: (context) => const LocationView(),
        );
      //! categoriesListViewRoute
      case categoriesListViewRoute:
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => CategoriesListView(
            text: args["text"],
            category: args["items"],
          ),
        );
      //! categoryItemsViewRoute
      case categoryItemsViewRoute:
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CategoriesCubit()..getData(path: args['path']),
            child: CategoryItemsView(text: args["text"]),
          ),
        );
      //! azkarCategoryViewRoute
      case azkarCategoryViewRoute:
        return MaterialPageRoute(
          builder: (context) => const AzkarCategoryView(),
        );
      //! quranViewRoute
      case quranViewRoute:
        var args = settings.arguments as int;
        int index = juz.indexWhere((element) => element[1] > args);
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ActionCubit(),
              ),
              BlocProvider(
                create: (context) => MarkCubit(),
              ),
              BlocProvider(
                create: (context) => ChangeJuzCubit(number: index),
              ),
              BlocProvider(
                create: (context) => ChangeNumberCubit(number: args),
              ),
            ],
            child: QuranView(surahPos: args),
          ),
        );
      //! sibhaViewRoute
      case sibhaViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SibhaCubit(),
              ),
              BlocProvider(
                create: (context) => SibhaTextCubit(),
              ),
            ],
            child: const SibhaView(),
          ),
        );
      //! allahNamesViewRoute
      case allahNamesViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AllahNamesCubit()..getData(),
            child: const AllahNamesView(),
          ),
        );
      //! favouriteSurahViewRoute
      case favouriteSurahViewRoute:
        return MaterialPageRoute(
          builder: (context) => const FavouriteSurahView(),
        );
      //! favouriteViewRoute
      case favouriteViewRoute:
        return MaterialPageRoute(
          builder: (context) => const FavouriteView(),
        );
      //! quranAudioViewRoute
      case quranAudioViewRoute:
        var args = settings.arguments as QuranAudioModel;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => QuranCubit()..getQuran(),
              ),
              BlocProvider(
                create: (context) => AudioPlayerCubit(),
              ),
            ],
            child: QuranAudioView(
              quranAudioModel: args,
            ),
          ),
        );
      //! audioViewRoute
      case audioViewRoute:
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AudioPlayerCubit(),
              ),
              BlocProvider(
                create: (context) => AudioPlayerPositionCubit(),
              ),
            ],
            child: AudioView(
              object: args,
            ),
          ),
        );
      //! compassViewRoute
      case compassViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CompassCubit(),
            child: const CompassView(),
          ),
        );
      //! categoriesViewRoute
      case categoriesViewRoute:
        return MaterialPageRoute(
          builder: (context) => const CategoriesView(),
        );
      //! textViewRoute
      case textViewRoute:
        var args = settings.arguments as CategoriesModel1;
        return MaterialPageRoute(
          builder: (context) => TextView(categoriesModel1: args),
        );
      //! quranCategoryViewRoute
      case quranCategoryViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => QuranCubit()..getQuran(),
              ),
              BlocProvider(
                create: (context) => QuranAudioCubit()..getQuranAudio(),
              ),
            ],
            child: const QuranCategoryView(),
          ),
        );
      //! prayerViewRoute
      case prayerViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PrayerCubit(getIt.get<PrayerRepoImplement>())
              ..loadPrayerTimings(year: DateTime.now().year.toString()),
            child: const PrayerView(),
          ),
        );
      //! azkarDetailsRoute
      case azkarDetailsRoute:
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AzkarCounterCubit(),
              ),
              BlocProvider(
                create: (context) => AzkarCubit()..getAzkar(path: args['path']),
              ),
            ],
            child: AzkarDetailsView(
              text: args['text'],
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No Route Found"),
              ),
            );
          },
        );
    }
  }
}
