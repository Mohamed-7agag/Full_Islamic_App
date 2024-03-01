import 'dart:convert';
import 'package:advanced_quran_app/Features/categories/data/models/categories_model1.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> getData({required String path}) async {
    try {
      emit(CategoriesLoading());

      String jsonStr = await rootBundle.loadString(path);
      final jsonData = json.decode(jsonStr);

      List<CategoriesModel1> dataList = [];
      for (var item in jsonData) {
        dataList.add(CategoriesModel1.fromJson(item));
      }

      emit(CategoriesSuccess(list: dataList));
    } catch (e) {
      emit(CategoriesFailure(errMessage: e.toString()));
    }
  }
}
