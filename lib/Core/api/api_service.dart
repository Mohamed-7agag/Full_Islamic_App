import 'package:advanced_quran_app/Core/api/api_requests.dart';
import 'package:advanced_quran_app/Core/api/end_points.dart';
import 'package:advanced_quran_app/cache/cache_helper.dart';
import 'package:dio/dio.dart';

class ApiServices extends ApiRequests {
  final Dio _dio;

//! Dio properties
  ApiServices(this._dio) {
    _dio.options.baseUrl = EndPoint.baseUrl;
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

//! Get prayer timing for year
  @override
  Future getPrayerTiming({required String year}) async {
    final response = await _dio.get(
      "$year?latitude=${CacheHelper.getString('lat').toString()}&longitude=${CacheHelper.getString('long').toString()}&method=${ApiKey.method}",
    );
    return response.data;
  }
}
