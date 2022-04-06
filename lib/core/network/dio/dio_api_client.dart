import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nannyvanny/core/network/api_client.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:nannyvanny/core/network/dio/dio_extension.dart';
import 'package:nannyvanny/ui/screen/base_screen/model/booking_data_model.dart';

import 'endpoints.dart';

class DioApiClient extends ApiClient {
  static late DioApiClient _service;

  static Dio? _dio;

  static Dio get _dioClient => _dio!;

  DioApiClient._();

  static Future<DioApiClient> getInstance() async {
    if (_dio == null) {
      _dio = _init();
      _service = DioApiClient._();
    }
    return _service;
  }

  static Dio _init() {
    final dio = Dio();
    dio.options.baseUrl = BaseUrl.baseUrl;

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (Foundation.kDebugMode) {
            if (options.data is FormData) {
              FormData d = options.data;
              d.fields.forEach(((field) => Foundation.debugPrint(
                  'Fields: ${field.key}: ${field.value}')));
              d.files.forEach(((field) => print(
                  'Files: ${field.key}: ${field.value.filename} (${field.value.contentType?.mimeType})')));
            }
          }
          return handler.next(options);
        },
      ),
    );

    //add logging interceptor with debug check
    dio.interceptors.add(LogInterceptor(
      requestBody: Foundation.kDebugMode,
      request: Foundation.kDebugMode,
      requestHeader: Foundation.kDebugMode,
      responseBody: Foundation.kDebugMode,
    ));
    return dio;
  }

  @override
  Future<BookingDataModel> getData() async {
    final request = await _dioClient.getApi(UrlPath.getData);
    return BookingDataModel.fromJson(request.data);
  }
}
