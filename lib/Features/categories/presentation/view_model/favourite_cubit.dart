import 'dart:convert';
import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Features/categories/data/models/categories_model1.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FavouriteState { initial, isFavourite, categoryToggle }

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteState.initial);

  //! Get all favourite categories from cache
  List<CategoriesModel1> _getFavouriteCategoriesFromCache() {
    String jsonStr = CacheHelper.getString(favouriteKey);

    if (jsonStr.isEmpty) return [];
    List<dynamic> favouriteCategories = json.decode(jsonStr);
    return favouriteCategories
        .map((item) => CategoriesModel1.fromJson(item))
        .toList();
  }

  //! Get all favourite categories
  List<CategoriesModel1> getAllFavouriteCategories() {
    return _getFavouriteCategoriesFromCache();
  }

  //! Check if a category is favourite
  bool isFavourite(CategoriesModel1 category) {
    final List<CategoriesModel1> favouriteCategories =
        _getFavouriteCategoriesFromCache();
    final bool isFav = favouriteCategories
        .any((item) => mapEquals(item.toJson(), category.toJson()));
    emit(FavouriteState.isFavourite);
    return isFav;
  }

  //! Toggle favourite status
  void toggleFavourite({required CategoriesModel1 category}) {
    List<CategoriesModel1> favouriteCategories =
        _getFavouriteCategoriesFromCache();

    if (isFavourite(category)) {
      favouriteCategories.removeWhere(
          (item) => mapEquals(item.toJson(), category.toJson()));
    } else {
      favouriteCategories.add(category);
    }

    final String jsonList =
        json.encode(favouriteCategories.map((c) => c.toJson()).toList());
    CacheHelper.setData(key: favouriteKey, value: jsonList);

    emit(FavouriteState.categoryToggle);
  }
}
