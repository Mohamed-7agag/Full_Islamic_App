import 'dart:convert';
import 'package:advanced_quran_app/Features/prayer/data/models/prayer_model/prayer_model.dart';
import 'package:advanced_quran_app/Features/prayer/data/repos/prayer_repo.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit(this.prayerRepo) : super(PrayerInitial());

  final PrayerRepo prayerRepo;

  Future<void> getPrayerTiming({required String year}) async {
    emit(PrayerLoading());
    
    var result = await prayerRepo.getPrayerTiming(year: year);
    result.fold((failure) {
      emit(PrayerFailure(errMessage: failure.errMessage));
    }, (items) async {
      List<String> itemsList =
          items.map((item) => jsonEncode(item.toJson())).toList();
      await CacheHelper.setData(key: 'prayerTimings_$year', value: itemsList);
      emit(PrayerSuccess(prayerModelList: items));
    });
  }

  void loadPrayerTimings({required String year}) {
    List<String> jsonStr =
        CacheHelper.getStringList(key: 'prayerTimings_$year');

    if (jsonStr.isNotEmpty) {
      List<PrayerModel> items = jsonStr
          .map((item) => PrayerModel.fromJson(jsonDecode(item)))
          .toList();
      emit(PrayerSuccess(prayerModelList: items));
    } else {
      getPrayerTiming(year: year);
    }
  }
}
