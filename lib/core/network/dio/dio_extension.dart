import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../utils/error_utils.dart';

extension DioEx on Dio {
  /// Top level methods
  /// common GET method
  Future<ApiResponse> getApi(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await get(
        path,
        queryParameters: queryParameters,
      );
      return _getResponse(response);
    } on DioError catch (e) {
      throw _getError(e);
    }
  }

  /// Common POST method
  Future<ApiResponse> postApi(
    String path, {
    dynamic map,
  }) async {
    try {
      Response response = await post(
        path,
        data: map,
      );
      return _getResponse(response);
    } on DioError catch (e) {
      throw _getError(e);
    }
  }

  ApiError _getError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ApiError(ErrorType.timeout);
      case DioErrorType.other:
        if (e.error is SocketException) {
          return ApiError(ErrorType.noConnection);
        }
        return ApiError(ErrorType.unknown);
      default:
        return ApiError(ErrorType.unknown);
    }
  }

  ApiResponse _getResponse(Response response) {
    if (response.data != null) {
      return ApiResponse(jsonDecode(response.data));
    }
    throw ApiError(
      ErrorType.apiFailure,
      code: "UNKNOWN_ERROR",
      message: "Unknown error",
    );
  }
}
