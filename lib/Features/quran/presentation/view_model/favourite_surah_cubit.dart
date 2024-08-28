import 'dart:convert';
import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FavouriteSurahState { initial, isFavourite, surahToggle }

class FavouriteSurahCubit extends Cubit<FavouriteSurahState> {
  FavouriteSurahCubit() : super(FavouriteSurahState.initial);

//! Get all favourite Surahs from cache
  List<Map<String, dynamic>> _getFavouriteSurahsFromCache() {
    String jsonStr = CacheHelper.getString(favouriteSurahKey);

    if (jsonStr.isEmpty) return [];
    List<dynamic> favouriteSurahs = json.decode(jsonStr);
    return favouriteSurahs.cast<Map<String, dynamic>>();
  }

//! Get all favourite Surahs
  List<Map<String, dynamic>> getAllFavouriteSurahs() {
    return _getFavouriteSurahsFromCache();
  }

//! Check if a Surah is favourite
  bool isFavourite(Map<String, dynamic> surah) {
    final List<Map<String, dynamic>> favouriteSurahs =
        _getFavouriteSurahsFromCache();
    final bool isFav = favouriteSurahs.any((item) => mapEquals<String, dynamic>(item, surah));
    emit(FavouriteSurahState.isFavourite);
    return isFav;
  }

//! Toggle favourite status
  void toggleFavourite({required Map<String, dynamic> surah}) {
    List<Map<String, dynamic>> favouriteSurahs = _getFavouriteSurahsFromCache();

    if (isFavourite(surah)) {
      favouriteSurahs.removeWhere((item) => mapEquals(item, surah));
    } else {
      favouriteSurahs.add(surah);
    }

    final String jsonList = json.encode(favouriteSurahs);
    CacheHelper.setData(key: favouriteSurahKey, value: jsonList);

    emit(FavouriteSurahState.surahToggle);
  }
}
