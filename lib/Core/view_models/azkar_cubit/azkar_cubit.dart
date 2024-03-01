import 'dart:convert';
import 'package:advanced_quran_app/Core/models/azkar_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());
  Future<void> getAzkar({required String path}) async {
    try {
      emit(AzkarLoading());
      String jsonStr = await rootBundle.loadString(path);

      final jsonData = json.decode(jsonStr);

      List<AzkarModel> dataList = [];
      for (var item in jsonData['content']) {
        dataList.add(AzkarModel.fromJson(item));
      }

      emit(AzkarSuccess(azkar: dataList));
    } catch (e) {
      emit(AzkarFailure(errMessage: e.toString()));
    }
  }
}
