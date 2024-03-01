import 'package:advanced_quran_app/Core/api/api_service.dart';
import 'package:advanced_quran_app/Features/prayer/data/repos/prayer_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<PrayerRepoImplement>(
    PrayerRepoImplement(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
}
