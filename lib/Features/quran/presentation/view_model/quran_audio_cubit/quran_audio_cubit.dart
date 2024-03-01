import 'dart:convert';
import 'package:advanced_quran_app/Features/quran/data/models/quran_audio_model/quran_audio_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'quran_audio_state.dart';

class QuranAudioCubit extends Cubit<QuranAudioState> {
  QuranAudioCubit() : super(QuranAudioInitial());
  Future<void> getQuranAudio() async {
    try {
      emit(QuranAudioLoading());
      String jsonStr =
          await rootBundle.loadString("assets/json/quran_audio.json");

      final jsonData = json.decode(jsonStr);

      List<QuranAudioModel> dataList = [];
      for (var item in jsonData['data']) {
        dataList.add(QuranAudioModel.fromJson(item));
      }

      emit(QuranAudioSuccess(list: dataList));
    } catch (e) {
      emit(QuranAudioFailure(errMessage: e.toString()));
    }
  }
}
