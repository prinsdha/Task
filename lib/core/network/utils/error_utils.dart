enum ErrorType { timeout, noConnection, apiFailure, localError, unknown }

class ApiError {
  final ErrorType type;
  final String code;
  final String message;

  ApiError(this.type, {this.code = "", this.message = ""});
}

class ApiResponse<T> {
  final T data;

  ApiResponse(this.data);
}
