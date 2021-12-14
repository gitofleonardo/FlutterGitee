class BaseResult<T> {
  int? resultCode;
  late BaseStatus state;
  T? data;
  String? errorMessage;
}

enum BaseStatus { success, failure, networkFailure, unauthorized }
