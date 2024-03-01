import 'package:advanced_quran_app/Core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../models/prayer_model/prayer_model.dart';

abstract class PrayerRepo {
  Future<Either<Failure, PrayerModel>> getPrayerTiming({required String date});
}
