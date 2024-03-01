import 'package:advanced_quran_app/Features/prayer/data/models/prayer_model/prayer_model.dart';
import 'package:advanced_quran_app/Features/prayer/data/repos/prayer_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit(this.prayerRepo) : super(PrayerInitial());

  final PrayerRepo prayerRepo;

  Future<void> getPrayerTiming({required String date}) async {
    emit(PrayerLoading());
    var result = await prayerRepo.getPrayerTiming(date: date);
    result.fold((failure) {
      emit(PrayerFailure(errMessage: failure.errMessage));
    }, (item) {
      emit(PrayerSuccess(prayerModel: item));
    });
  }
}
