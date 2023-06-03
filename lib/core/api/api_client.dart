import 'package:flutter/foundation.dart';
import 'package:website/core/api/response_wrapper.dart';
import 'package:dio/dio.dart';
import '../constants.dart';

enum RequestType { get, put, post, delete, patch }

class APIClient {
  String? token;

  Dio _buildDio() {
    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    if (token != null) headers.addAll({"Authorization": "Bearer $token"});

    var options = BaseOptions(
      baseUrl: GIT_HUB,
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 3000),
      headers: headers,
    );
    Dio dio = Dio(options);
    return dio;
  }

  Future<ResponseWrapper> request({
    required RequestType type,
    required String path,
    Map<String, dynamic> data = const {},
    Map<String, dynamic> query = const {},
  }) async {
    try {
      Response<dynamic> response;
      switch (type) {
        case RequestType.get:
          response = await _buildDio().get(path, queryParameters: query);
          break;
        case RequestType.put:
          response = await _buildDio().put(path, data: data, queryParameters: query);
          break;
        case RequestType.post:
          response = await _buildDio().post(path, data: data, queryParameters: query);
          break;
        case RequestType.delete:
          response = await _buildDio().delete(path, data: data, queryParameters: query);
          break;
        case RequestType.patch:
          response = await _buildDio().patch(path, data: data, queryParameters: query);
          break;
      }

      _printRequestLog(type, response);

      if (response.statusCode == 200)
        return SuccessWrapper(data: response.data);
      else {
        return _buildErrorWrapper(
          response,
          response.statusCode.toString(),
        );
      }
    } on DioError catch (e) {
      _printErrorLog(e);
      return _buildErrorWrapper(
        e.response,
        e.response?.statusCode.toString(),
      );
    }
  }

  /// Auxiliary methods
  ErrorWrapper _buildErrorWrapper(Response<dynamic>? response, String? tag) {
    return ErrorWrapper(
      errorResponse: ResponseError(
        errorMessage: _handleErrorMessage(response),
        errorTag: tag,
      ),
    );
  }

  String _handleErrorMessage(Response<dynamic>? response) {
    String message = "";
    if (response != null) {
      message = response.statusMessage ?? "";

      if ((message == "") && (response.data is Map<String, dynamic>)) {
        if (response.data.containsKey("error")) {
          message = response.data["error"];
        }
      }
    }
    return message;
  }

  void _printRequestLog(RequestType type, Response<dynamic> response) {
    if (kDebugMode) {
      print("URL -> $type ${response.realUri}");
      print("StatusCode: ${response.statusCode}, StatusMessage: ${_handleErrorMessage(response)}");
      print("Response -> ${response.data}");
    }
  }

  void _printErrorLog(DioError e) {
    if (kDebugMode) {
      print("StatusCode: ${e.response?.statusCode}, StatusMessage: ${_handleErrorMessage(e.response)}");
    }
  }
}
