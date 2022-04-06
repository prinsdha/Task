import 'error_utils.dart';

class ErrorUtil {
  static const DEFAULT_ERROR_MESSAGE = "Something went wrong";
  static const _NO_INTERNET_ERROR_MESSAGE = "No internet connection";
  static const _TIMEOUT_ERROR_MESSAGE =
      "Please check your internet connection. It is taking too long to connect.";

  static const VERSION_NOT_SUPPORTED = 'VERSION_NOT_SUPPORTED';

  static String getApiError(error) {
    if (error is ApiError) {
      return ErrorUtil.getErrorMessageForApiError(error);
    }
    return ErrorUtil.DEFAULT_ERROR_MESSAGE;
  }

  static String getErrorMessageForApiError(ApiError apiError) {
    switch (apiError.type) {
      case ErrorType.timeout:
        return _TIMEOUT_ERROR_MESSAGE;
      case ErrorType.noConnection:
        return _NO_INTERNET_ERROR_MESSAGE;
      default:
        return apiError.message;
    }
  }
}
