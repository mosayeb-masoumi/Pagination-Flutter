import 'dart:convert';

import 'package:dio/dio.dart';


class DioUtil {
  static Dio? _instance;
//method for getting dio instance
  static Dio? getInstance() {
    if (_instance == null) {
      _instance = createDioInstance();
    }
    return _instance;
  }

  static Dio createDioInstance() {
    var dio = Dio();
    // adding interceptor
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {

      // options.headers["Authorization"] = "Bearer " + refreshToken;
      // var refreshToken = SharePrefs.getRefreshToken();
      // options.headers["Authorization"] = "Bearer " + refreshToken!;
      options.headers["Accept"] = "application/json";
      return handler.next(options);//modify your request
    }, onResponse: (response, handler) {
      if (response != null) {//on success it is getting called here
        return handler.next(response);
      } else {
        return null;
      }
    }, onError: (DioError e, handler) async {

      if (e.response != null) {
        if (e.response?.statusCode == 401) {//catch the 401 here

            return null;

        } else {
          handler.next(e);
        }
      }

    }));
    return dio;
  }


}