import 'package:website/core/api/response_wrapper.dart';
import 'package:dio/dio.dart';
import '../constants.dart';

class APIClient {
  String? token;

  Dio _buildDio() {
    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    };
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    var options = BaseOptions(
        baseUrl: GIT_HUB,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: headers,
    );
    Dio dio = Dio(options);
    return dio;
  }

  Future<ResponseWrapper> get({
    required String path,
  }) async {
    try {
      Response<dynamic> response =
          await _buildDio().get(path);

      if (response.statusCode == 200)
        return SuccessWrapper(data: response.data);
      else {
        return ErrorWrapper(
          errorResponse: ResponseError(
            errorMessage: response.statusMessage ?? "",
            errorTag: response.statusCode.toString(),
          ),
        );
      }
    } on DioError catch (e) {
      return ErrorWrapper(
        errorResponse: ResponseError(
          errorMessage: e.response?.statusMessage ?? "",
          errorTag: e.response?.statusCode.toString(),
        ),
      );
    }
  }

}
