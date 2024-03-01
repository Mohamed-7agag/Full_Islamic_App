import 'package:advanced_quran_app/Core/api/api_service.dart';
import 'package:advanced_quran_app/Core/errors/failure.dart';
import 'package:advanced_quran_app/Features/prayer/data/models/prayer_model/prayer_model.dart';
import 'package:advanced_quran_app/Features/prayer/data/repos/prayer_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PrayerRepoImplement implements PrayerRepo {
  final ApiServices apiServices;

  PrayerRepoImplement({required this.apiServices});
  @override
  Future<Either<Failure, PrayerModel>> getPrayerTiming(
      {required String date}) async {
    try {
      var data = await apiServices.getPrayerTiming(date: date);
      PrayerModel item = PrayerModel.fromJson(data);
      return right(item);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
