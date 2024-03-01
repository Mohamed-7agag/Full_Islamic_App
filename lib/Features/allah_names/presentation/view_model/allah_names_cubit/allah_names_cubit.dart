import 'dart:convert';
import 'package:advanced_quran_app/Core/models/allah_names_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'allah_names_state.dart';

class AllahNamesCubit extends Cubit<AllahNamesState> {
  AllahNamesCubit() : super(AllahNamesInitial());
  Future<void> getData() async {
    try {
      emit(AllahNamesLoading());
      String jsonStr =
          await rootBundle.loadString("assets/json/Names_Of_Allah.json");

      final jsonData = json.decode(jsonStr);

      List<AllahNamesModel> dataList = [];
      for (var item in jsonData['content']) {
        dataList.add(AllahNamesModel.fromJson(item));
      }

      emit(AllahNamesSuccess(dataList: dataList));
    } catch (e) {
      emit(AllahNamesFailure(errMesaage: e.toString()));
    }
  }
}
