import 'dart:convert';
import 'package:advanced_quran_app/Core/utils/constants.dart';
import 'package:advanced_quran_app/Features/categories/data/models/categories_model1.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FavouriteState { favourite, unfavourite, getliststate }

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteState.unfavourite);

  List<String> favouriteList = [];

  void favourite({required CategoriesModel1 categoriesModel1}) {
    String channelDetailModelStr = json.encode(categoriesModel1.toJson());
    List<String> savedList = CacheHelper.getStringList(key: favouriteKey);
    if (!savedList.contains(channelDetailModelStr)) {
      savedList.add(channelDetailModelStr);
      favouriteList = savedList;
      CacheHelper.setData(key: favouriteKey, value: favouriteList);
      emit(FavouriteState.favourite);
    } else {
      String channelDetailModelStr = json.encode(categoriesModel1.toJson());
      List<String> savedList = CacheHelper.getStringList(key: favouriteKey);
      savedList.remove(channelDetailModelStr);
      favouriteList = savedList;
      CacheHelper.setData(key: favouriteKey, value: favouriteList);
      emit(FavouriteState.unfavourite);
    }
  }

  void unFavourite({required CategoriesModel1 categoriesModel1}) {
    String channelDetailModelStr = json.encode(categoriesModel1.toJson());
    List<String> savedList = CacheHelper.getStringList(key: favouriteKey);
    savedList.remove(channelDetailModelStr);
    favouriteList = savedList;
    CacheHelper.setData(key: favouriteKey, value: favouriteList);
    emit(FavouriteState.unfavourite);
  }

  List<CategoriesModel1> getFavouriteList() {
    List<String> savedList = CacheHelper.getStringList(key: favouriteKey);

    List<CategoriesModel1> favouriteList = [];
    for (var element in savedList) {
      favouriteList.add(CategoriesModel1.fromJson(json.decode(element)));
    }
    emit(FavouriteState.getliststate);
    return favouriteList;
  }
}
