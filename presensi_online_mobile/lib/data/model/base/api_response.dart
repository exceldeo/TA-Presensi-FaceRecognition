import 'package:dio/dio.dart';

class ApiResponse<T> {
  final T response;
  final dynamic error;

  ApiResponse(this.response, this.error);

  ApiResponse.withError(dynamic errorValue)
      : response = null,
        error = errorValue;

  ApiResponse.withSuccess(T responseValue)
      : response = responseValue,
        error = null;
}
