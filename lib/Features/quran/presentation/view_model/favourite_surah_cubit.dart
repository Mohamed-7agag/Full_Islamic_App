import 'dart:convert';
import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FavouriteSurahState { favourite, unfavourite, getliststate }

class FavouriteSurahCubit extends Cubit<FavouriteSurahState> {
  FavouriteSurahCubit() : super(FavouriteSurahState.unfavourite);

  List<String> favouriteSurahList = [];

  void favourite({required Map<String, dynamic> object}) {
    String objectStr = json.encode(object);
    List<String> savedList = CacheHelper.getStringList(key: favouriteSurahKey);
    if (!savedList.contains(objectStr)) {
      savedList.add(objectStr);
      favouriteSurahList = savedList;
      CacheHelper.setData(key: favouriteSurahKey, value: favouriteSurahList);
      emit(FavouriteSurahState.favourite);
    } else {
      String objectStr = json.encode(object);
    List<String> savedList = CacheHelper.getStringList(key: favouriteSurahKey);
      savedList.remove(objectStr);
      favouriteSurahList = savedList;
      CacheHelper.setData(key: favouriteSurahKey, value: favouriteSurahList);
      emit(FavouriteSurahState.unfavourite);
    }
  }

  void unFavourite({required Map<String, dynamic> object}) {
    String objectStr = json.encode(object);
    List<String> savedList = CacheHelper.getStringList(key: favouriteSurahKey);
    savedList.remove(objectStr);
    favouriteSurahList = savedList;
    CacheHelper.setData(key: favouriteSurahKey, value: favouriteSurahList);
    emit(FavouriteSurahState.unfavourite);
  }

  List<Map<String,dynamic>> getFavouriteSurahList() {
    List<String> savedList = CacheHelper.getStringList(key: favouriteSurahKey);

    List<Map<String,dynamic>> favouriteList = [];
    for (var element in savedList) {
      favouriteList.add(json.decode(element));
    }
    emit(FavouriteSurahState.getliststate);
    return favouriteList;
  }
}
