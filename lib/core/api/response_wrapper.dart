abstract class ResponseWrapper {}

class EmptyWrapper extends ResponseWrapper { }

class SuccessWrapper extends ResponseWrapper {
  SuccessWrapper({required this.data});

  final dynamic data;

}

class ErrorWrapper extends ResponseWrapper {
  ErrorWrapper({required this.errorResponse});

  final ResponseError errorResponse;
}

class ResponseError {

  ResponseError({required this.errorMessage, this.errorTag});

  final String errorMessage;
  final String? errorTag;

}
