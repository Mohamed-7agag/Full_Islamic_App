import 'dart:convert';
import 'package:advanced_quran_app/Features/quran/data/models/quran_model/quran_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  Future<void> getQuran() async {
    try {
      emit(QuranLoading());
      String jsonStr = await rootBundle.loadString("assets/json/Quran.json");

      final jsonData = json.decode(jsonStr);

      List<QuranModel> dataList = [];
      for (var item in jsonData['content']) {
        dataList.add(QuranModel.fromJson(item));
      }

      emit(QuranSuccess(quran: dataList));
    } catch (e) {
      emit(QuranFailure(errMessage: e.toString()));
    }
  }
}
